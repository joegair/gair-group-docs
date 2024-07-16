test -f /etc/profile.dos && . /etc/profile.dos

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/nano
#export EDITOR=/usr/bin/mcedit

# add aliases if there is a .aliases file
test -s ~/.alias && . ~/.alias
alias sq='squeue  --format="%.18i %.30j %.8u %.8T %.10M %.9l" --me'
PATH=$PATH:~/scripts


