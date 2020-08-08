#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "${SCRIPT_DIR}"

find ./engine -name \*.jar -print | grep jme3 | grep -v javadoc | grep -v sources | while read -r fname
do
  echo "$fname" | grep -q "^/" && fname="."$fname
  renamed=$(basename "$fname" | sed -e 's/-3.2.4-v3.2-SNAPSHOT//g')
  cp -f "${fname}" "lib/${renamed}"
done