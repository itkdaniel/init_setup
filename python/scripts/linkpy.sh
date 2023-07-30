#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ]; then
   echo "Missing python version provided. Usage: linkpy [py1] [py2]"
   exit 1
fi

uhost="$(whoami)@$(hostname):~$"

echo "########### Check ###########"
echo "$uhost" "$2 --version"
($2 --version)

# link [py1] [p2]; creates symbolic link [py2] executes [py1]
# Maps [py1]-version --> [py2]-command
# format of [py1] [py2] should be: "python{shortversion#}"
# ( i.e python(#.#) python(#(.#))? )
py1="/usr/bin/$1"
py2="/usr/bin/$2"

echo

echo "Creating link: $py1 --> $py2"
sudo ln -sfv $py1 $py2

echo "."
echo "."
echo "."

echo "Created symbolic link: $py1 --> $py2"
echo "Run command '$2' to execute $1"

echo
echo "############ Test ############"

echo "$uhost" "$2 --version"
($2 --version)

exit 0
