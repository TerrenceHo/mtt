# mtt, My Tool Tips

mtt is a system tool designed to make it easier to access previous shell
commands you've used.  You can save previous commands, and get retrieve or list
them.  You can even use mtt to execute those commands for you.

API

mtt -s, mtt --save  {Saves last command entered into shell}
mtt -n COMMAND DESC, mtt --new COMMAND DESC  {Automatically makes a new entry of saved commands, based on entry string
mtt -l, mtt --list  {Lists commands that that you have saved}
mtt -l NAME, mtt list NAME {Lists all saved commands for a given shell command}
mtt -h, mtt --help
mtt -v, mtt --version

Specification
Saves shell commands in files, in the home directory, under ~/.mtt.
Inside, for each shell command that was given an entry, and file is created with
that name.  I.e., if ls was given a command, then there would be a file called
ls-mtt.  Once a file has been created, it will save all new command entries into
that file.  

Where a new entry is stored is placed under is based off of the first word in
the command string, which is usually how commands are based off.
