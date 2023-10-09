#!/bin/bash

cmd="-f csv /data/${test_file}"
callback(){
  mv -fv "${vol}/${test_file%.*}.csv" "${vol}/unoconv.csv"
}
