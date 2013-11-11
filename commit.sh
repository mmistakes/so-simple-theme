#!/bin/bash
echo -e '\nChange working directory'
cd /c/users/nmir/dropbox/writing/blog/abijango.github.io 

echo -e '\nChecking for Changes'
git add .

if [ -z "$1" ]
then
	descrption="cleanup"
else
	
	descrption="$1"
fi

git commit -a -m "$descrption"
echo -e "\nDescrption:" $descrption

git push origin master
echo -e '\nDone commiting!'