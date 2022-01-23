#!/bin/bash

# wiki importer 

if [[ ! -d ./wiki ]] ; then
  mkdir ./wiki
fi

cd ./wiki
wiki_instances=("emba" "embark")
for w_instance in "${wiki_instances[@]}" ; do
  if [[ ! -d ./$w_instance.wiki ]] ; then
    git clone https://github.com/e-m-b-a/$w_instance.wiki.git
  else
    cd ./$w_instance.wiki
    git pull
    cd ..
  fi
done

