#!/bin/bash
. conf.sh

cd $(dirname $(realpath "${BASH_SOURCE[0]}"))
vol="${PWD}/data"

src_file=$(realpath ${1:-./data/test.xlsx})
echo "> ${src_file}"
cp "$src_file" ./data/ 2>/dev/null
test_file=$(basename "${src_file}")

dock="docker run --rm -v ${vol}:/data"

lightblueb "== XLS-to-CSV showdown =="
callback(){
  true
}

for img in $xls2csv_images
do
  img_name="${docker_ns}/${img}"
  cmdfile="${img}.cmd"

  # empty file for failure reporting
  touch "${vol}/${img}.csv"

  if [ -f "$cmdfile" ]
  then
    greenb "$img"
    . $cmdfile
    $dock $img_name $cmd
    callback
  fi
done

first() {
  echo -n "${1}" | awk '{print $1}'
}


echo -e "\n\n"
lightblueb "== RESULTS =="

for f in ${vol}/*.csv
do
  size=$(first $(wc -c $f))
  lines=$(first $(wc -l $f))

  echo \
  $(green $(first $(sha1sum $f))) \
  $(yellow "$lines lines") \
  $(blue "${size} B") \
  $(white $f)
done
