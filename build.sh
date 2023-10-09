#!/bin/bash
. conf.sh

for img in $xls2csv_images
do
    img_name="${docker_ns}/${img}"
    blue "Building ${img_name}.."
    docker build -t "$img_name" -f "${img}.docker" .
    echo -e "\n\n"
done
