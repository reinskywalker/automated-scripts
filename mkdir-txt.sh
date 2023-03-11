#!/bin/bash

fileName="file.txt"

while read fileName; do
  name=$(echo $fileName | xargs)
  mkdir "$name"
done < "$names_file"
