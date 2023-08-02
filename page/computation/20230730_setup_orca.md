---
layout: default
title: Setup ORCA
parent: Computation
nav_order: 1
has_children: true
has_toc: false
summary: "Instructions for intalling ORCA and ChimeraX+SEQCROW for local DFT calculations."
permalink: /page/computation/setup.html
---

# {{page.title}}
{: .no_toc }

This page describes how to setup ORCA to perform DFT calculations on your personal machine. Plus instructions on how to setup ChimeraX+SEQCROW to setup, run, and analyze DFT jobs from a GUI.
{: .fs-6 .fw-300 .text-justify}



## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}


## Local ORCA
ORCA can be downloaded [here](https://orcaforum.kofo.mpg.de/index.php). You will need to register as a user before you can download.
{: .text-justify }

After downloading, you can use the detailed instructions found [here](https://sites.google.com/site/orcainputlibrary/setting-up-orca) to install ORCA for local use.
{: .text-justify }


## ChimeraX

ChimeraX is a first-rate (and free) molecular visualization program that can be downloaded [here](https://www.cgl.ucsf.edu/chimerax/).
{: .text-justify }


## SEQCROW

[SEQCROW](https://cxtoolshed.rbvi.ucsf.edu/apps/seqcrow) is an extension to ChimeraX that offers several tools for setting up and analyzing molecular modelling tasks. After installing ChimeraX, the SEQCROW extension can be added from the dropdown menu Tools ... More Tools. A window of popular extensions will popup and SEQCROW will be near the top of the list of popular extensions. Click the SEQCROW icon and then the "Download" icon.
{: .text-justify }

To run submit ORCA calculations locally via ChimeraX+SEQCROW go to the ChimeraX dropdown tool and select settings/preferences. In the resulting dialog, go to the SEQCROW Jobs tab. Under this tab you will need to set the ORCA executable and scratch directory path. Here is what mine looks like... 

```
ORCA executable /Applications/orca/orca
Scratch directory /Users/joe/SEQCROW_SCRATCH
```

You can create a SEQCROW_SCRATCH directory anywhere that is convenient for you.

Once SEQCROW is installed you can find relevant tutorials in ChimeraX by navigating to Help ... SEQCROW Tutorials.

Additional info about SEQCOW usage can be found at the [SEQCROW wiki](https://github.com/QChASM/SEQCROW/wiki?)


## Optional



### Anaconda

Anaconda is a useful tool for installing and maintaining compatible versions of open source programs. Start by installing [Anaconda](https://docs.conda.io/projects/conda/en/stable/user-guide/install/index.html). 

Before installing packages for performing these jobs, it is good practice to use virtual environments to avoid incompatibilities between installed packages. 

To create a virtual environment for testing molecular modelling packages, open a terminal and run `conda create --name molmodel`.

Note that your terminal line reads `(base) ~ $`(or something similarly generic). Now enter `conda activate molmodel` and you will notice that the terminal prompt changes to `molmodel ~ $`.

Whenever working with molecular modelling locally or installing related packages be sure that you have activated your `molmodel` virtual environment.  To deactivate the `molmodel` environment run `conda deactivate`

You can create as many virtual environments as you want. Feel free to create new environments when testing new packages. Avoid installing new packages in your base environment.


### XTB

[XTB](https://xtb-docs.readthedocs.io/en/latest/setup.html) (extended tight binding) is a progam for peforming semiempirical quantum mechanical calculations. It is very convenient for rapid geometry optimizations. XTB can be used as a standalone program, but I typically use XTB via ORCA or ChimeraX+SEQCROW

To install XTB locally, activate the appropriate virtual environment and run


```
conda config --add channels conda-forge
conda install xtb
```

Confirm installation with `which xtb`, which will return the path to the xtb executable. For me the output is `/Users/joe/anaconda3/envs/molmodel1/bin/xtb`.

To allow ORCA to use xtb, find the location where xtb was installed, go to that directory and copy the xtb file to the directory that holds the ORCA executables (`which ORCA` returns `/Applications/orca/orca`). Then rename the xtb file from `xtb` to `otool_xtb`. Now ORCA can use xtb on your local machine.

### CREST

[crest](https://crest-lab.github.io/crest-docs/) (Conformer–Rotamer Ensemble Sampling Tool) is a valuable tool for generating high-quality conformational ensembles from meta-dynamics simulations powered by semiempirical quantum chemical calculations. Crest jobs can be generated and submitted locally via a graphical user interface using ChimeraX+SEQCROW. To install crest locally, activate the appropriate virtual environment and run

```
conda config --add channels conda-forge
conda install crest
```

Confirm installation with `which crest`. This should print the path to the crest executable, eg `/Users/joe/anaconda3/envs/molmodel1/bin/crest`.

To use *crest* directly from SEQCROW, set the CREST executable in ChimeraX (see instructions in SEQCROW section above)






