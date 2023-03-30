#!/bin/bash
## Get help
if [ "$1" == "help" ]
  then
    echo "Usage: rename.sh PROJECT_SHORTNAME PROJECT_FULLNAME"
    exit 0
fi

## Quit if arguments aren't present
if [ -z "$1" ] || [ -z "$2" ]
  then
    echo "Missing arguments. Must provide PROJECT_SHORTNAME and PROJECT_FULLNAME"
    exit 1  
fi

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit 1
fi
fullname=$2
shortname=$1

find . -type f -name "*.md" -print0 | xargs -0 sed -i '' -e "s/PROJECT_SHORTNAME/${shortname}/g"
find . -type f -name "*.md" -print0 | xargs -0 sed -i '' -e "s/PROJECT_FULLNAME/${fullname}/g"
find . -type f -name "*.py" -print0 | xargs -0 sed -i '' -e "s/PROJECT_SHORTNAME/${shortname}/g"
find . -type f -name "*.py" -print0 | xargs -0 sed -i '' -e "s/PROJECT_FULLNAME/${fullname}/g"
mv ./PROJECT_SHORTNAME ./$shortname
mv ./$shortname/PROJECT_SHORTNAME.py ./$shortname/$shortname.py
mv ./tests/test_PROJECT_SHORTNAME.py ./tests/test_$shortname.py

echo "OK!"