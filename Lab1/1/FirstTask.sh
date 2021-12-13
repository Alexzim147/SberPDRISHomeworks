#!/bin/zsh
repoLink=$1
firstBranch=$2
secondBranch=$3

git clone $repoLink temp
cd temp
git checkout $firstBranch > /dev/null
git checkout $secondBranch > /dev/null
git diff --name-status $firstBranch $secondBranch > ../filenamesDiff.txt
cd ..
rm -rf temp