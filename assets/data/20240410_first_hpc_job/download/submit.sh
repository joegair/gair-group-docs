#!/bin/bash

# written by Mitch Maday April 2024

mkdir -p outputs
gaussian=$(cat <<EOF
#!/bin/bash

#SBATCH -J @NAME		    # Job name
#SBATCH -n 1 -c @NPROC	    # cpus requested *less cpus and time = faster job submission*
#SBATCH --nodes=1	    # nodes requested
#SBATCH --mem=@MEMG	    # memory requested
#SBATCH --time=@HOURS:00:00 	    # time requested HHH:MM:SS *quick limit 4h* *total limit 168h*
#SBATCH --mail-type=@MAIL  # BEGIN and FAIL are also useful values
#SBATCH --mail-user=@USERNAME@msu.edu

ulimit -c 0
module load Gaussian/16.C.01-AVX2

mkdir \$SCRATCH/@NAME
export GAUSS_SCRDIR=\$SCRATCH/@NAME

g16 < @NAME.gjf > @NAME.log

rm -rf \$SCRATCH/@NAME
rm fort.7
rm *.out

mv @NAME.log "../outputs/"

EOF
)

orca=$(cat <<EOF
#!/bin/bash

#SBATCH -J @NAME
#SBATCH -N 1
#SBATCH --tasks-per-node=@NPROC
#SBATCH --mem=@MEMG
#SBATCH --time=@HOURS:00:00
#SBATCH --error="%x.e%j"
#SBATCH --output="%x.o%j"

#Setting OPENMPI paths here:
export PATH=/users/home/user/openmpi/bin:\$PATH
export LD_LIBRARY_PATH=/users/home/user/openmpi/lib:\$LD_LIBRARY_PATH

# Here giving the path to the ORCA binaries and giving communication protocol

#You can also load module here.
module load ORCA/5.0.4-gompi-2023a
export orcadir=/opt/software-current/2023.06/x86_64/generic/software/ORCA/5.0.4-gompi-2023a/bin/orca
export RSH_COMMAND="/usr/bin/ssh -x"
export PATH=\$orcadir:\$PATH
export LD_LIBRARY_PATH=\$orcadir:\$LD_LIBRARY_PATH

# Creating local scratch folder for the user on the computing node.

#Set the scratchlocation variable to the location of the local scratch, e.g. /scratch or /localscratch
export scratchlocation=\$SCRATCH
if [ ! -d \$scratchlocation ]
then
  mkdir -p \$scratchlocation
fi

tdir=\$(mktemp -d \$scratchlocation/orcajob__\$SLURM_JOB_ID-XXXX)

# Copy only the necessary stuff in submit directory to scratch directory. Add more here if needed.
cp  \$SLURM_SUBMIT_DIR/@NAME.inp \$tdir/
cp  \$SLURM_SUBMIT_DIR/@NAME.gbw \$tdir/
cp  \$SLURM_SUBMIT_DIR/@NAME.xyz \$tdir/

# cd to scratch
cd \$tdir

#Start ORCA job. ORCA is started using full pathname (necessary for parallel execution). Output file is written directly to submit directory on frontnode.
\$orcadir @NAME.inp >>  \$SLURM_SUBMIT_DIR/@NAME.out

# ORCA has finished here. Now copy important stuff back (xyz files, GBW files etc.). Add more here if needed.
cp \$tdir/*.gbw \$SLURM_SUBMIT_DIR
cp \$tdir/*.engrad \$SLURM_SUBMIT_DIR
cp \$tdir/*.xyz \$SLURM_SUBMIT_DIR
cp \$tdir/*.loc \$SLURM_SUBMIT_DIR
cp \$tdir/*.qro \$SLURM_SUBMIT_DIR
cp \$tdir/*.uno \$SLURM_SUBMIT_DIR
cp \$tdir/*.unso \$SLURM_SUBMIT_DIR
cp \$tdir/*.uco \$SLURM_SUBMIT_DIR
cp \$tdir/*.hess \$SLURM_SUBMIT_DIR
cp \$tdir/*.cis \$SLURM_SUBMIT_DIR
cp \$tdir/*.dat \$SLURM_SUBMIT_DIR
cp \$tdir/*.mp2nat \$SLURM_SUBMIT_DIR
cp \$tdir/*.nat \$SLURM_SUBMIT_DIR
cp \$tdir/*.scfp_fod \$SLURM_SUBMIT_DIR
cp \$tdir/*.scfp \$SLURM_SUBMIT_DIR
cp \$tdir/*.scfr \$SLURM_SUBMIT_DIR
cp \$tdir/*.nbo \$SLURM_SUBMIT_DIR
cp \$tdir/FILE.47 \$SLURM_SUBMIT_DIR
cp \$tdir/*_property.txt \$SLURM_SUBMIT_DIR
cp \$tdir/*spin* \$SLURM_SUBMIT_DIR

cd \$SLURM_SUBMIT_DIR
cd ..
mv @NAME/@NAME.out outputs/

EOF
)

function write_input() {
	local template
	if [ "$extension" = "inp" ]; then
		template="$orca"
		cpus=$(grep -oiP '(?<=\bnprocs\s)\d+' "$calc")
		mem=$((( ($(grep -oiP '(?<=\bmaxcore\s)\d+' "$calc") * cpus) + 2000) / 1000 ))
	elif [ "$extension" = "gjf" ]; then
		template="$gaussian"
		mem=$(grep -m 1 %mem "$calc" | cut -d "=" -f 2 | sed s/GB// | awk '{print $1 + 2}')
		cpus=$(grep -m 1 %nprocshared "$calc" | cut -d "=" -f 2 )
	else
		echo "File given to was not a .gjf or .inp file.
		This is a redundant check and shouldn't happen"
	fi

	echo "$template" | sed s/@NAME/"$base_name"/g  \
	| sed s/@NPROC/"$cpus"/g \
	| sed s/@MEM/"$mem"/g \
	| sed s/@HOURS/"$hours"/g \
	| sed s/@MAIL/"$mail"/g \
	| sed s/@USERNAME/"$username"/g > "$base_name.sb"
}

function prompt_inputs() {
if [ "$prompt" = true ]; then
	read -p "Number of hours for job $calc?" hours

	if (( hours < 0 )) || (( hours > 168 )); then
	echo "Invalid number of hours was given, it is now set to 4"
		hours=4
	fi
fi
}

function help() {
	echo "-s flag will prevent SLURM emails from being sent"
	echo "-p flag will ask for prompts for calculation parameters on each input"
	echo "-t flag allows for default specification of number of hours (4h or less is fastest)"
	echo "Any files specified will be run. No arguments will run all in cwd)"
}

function duplicate_input() {
	echo "The current file, $calc, already has a corresponding directory"
	echo "Overwrite (\"o\") the existing files?"
	echo "Skip (\"s\") the calculation?"
	echo "Or rename (\"r\") the file"
	read choice
		if [ "$choice" == "r" ] || [ "$choice" == "R" ]; then
			echo "What is the new name of $calc?"
			echo "Be sure to include the .gjf or .inp"
			read new_name
			if [[ "$new_name" != "$calc" && ${new_name##*.} == "gjf" || ${new_name##*.} == "inp" ]]; then
				mv "$calc" "$new_name"
				calc="$new_name"
				base_name=${calc%.*}
				extension=${calc##*.}
			else
				echo "An invalid name was given. This input, $calc, will be skipped"
				# shellcheck disable=SC2104
				continue
			fi
		elif [ "$choice" == "s" ] || [ "$choice" == "S" ]; then
			echo "File, $calc, was skipped."
			# shellcheck disable=SC2104
			continue
		elif [ "$choice" == "o" ] || [ "$choice" == "O" ]; then
			rm -rf "$base_name"
			echo "Directory $base_name was removed and will be rewritten"
		else
			echo "Your input was not recognized. This file will be skipped."
			# shellcheck disable=SC2104
			continue
		fi
}

# This block processes flags for script '-p' gives time prompt '-t' allows
# setting defaults for each of those parameters respectively '-s' will save checkpoint and
# other associated files and '-h' will prompt for help dialogue.
prompt=false
mail="END,TIME_LIMIT"

username=$(whoami)
while getopts "hspc:t:" opt; do  # Add orca and Gaussian specific checkpoint flags
	case $opt in
		h)
			help
			exit 0
			;;
		s)
			mail="NONE"
			;;
		p)
			prompt=true
			;;
		t)
			hours="$OPTARG"
			;;
		*)
			echo "Invalid flag -$OPTARG was specified"
			exit 2
			;;
	esac
done

# Set default time if not stated by the flags
hours=${hours:-4}

# Shift to remove processed flags (should work even if no flags are specified)
shift $((OPTIND-1))

if [ "$#" -eq 0 ]; then
	for calc in *.{gjf,inp}; do  # iterate over all Gaussian and Orca inputs in cwd
		if [ -f "$calc" ]; then  # if these iterators exist, continue
			base_name=${calc%.*}
			extension=${calc##*.}

			if [ -d "$base_name" ]; then
				duplicate_input
			fi

			mkdir -p "$base_name"

			prompt_inputs # funtion that handles the prompt flag from earlier

			write_input
			mv "$calc" "$base_name"
			mv "${base_name}.sb" "$base_name"
			(
				cd "$base_name"
				sbatch "${base_name}.sb"
			)
		else
			true
			# For some reason this block is always triggered.
			# echo "No .gjf or .inp folders in cwd. This shouldn't happen"; exit 2
		fi
	done
else
	for calc in "$@"; do
		if [ -f "$calc" ]; then  # if these iterators exist, continue
			base_name=${calc%.*}
			extension=${calc##*.}

			if [ -d "$base_name" ]; then
				duplicate_input
			fi

			mkdir -p "$base_name"

			prompt_inputs # funtion that handles the prompt flag from earlier

			write_input
			mv "$calc" "$base_name"
			mv "${base_name}.sb" "$base_name"
			(
				cd "$base_name"
				sbatch "${base_name}.sb"
			)
		else
			echo "The specified .gjf or .inp files could not be found in cwd"; exit 2
		fi
	done
fi
