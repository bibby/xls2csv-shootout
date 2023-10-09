#!/bin/bash
cmd="/data/${test_file}"
callback(){
  mv -fv ${vol}/${test_file%.*}.csv ${vol}/libreoffice.csv
}
