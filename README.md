## Testing xlsx to csv converters

Converters are docker images suitable for FaaS and the like.

### build the images

Check conf.sh for change the docker image namespace if you care to.

    ./build

### test the conversion

Copy an excel file as `./data/test.xlsx`

OR name your file as an argument to `test.sh`

    ./test.sh        # converts ./data/test.xlsx
    ./test.sh /path/to/some.xlsx

Results will be found in `./data` as CSVs named after the converter that generated them.

    == RESULTS ==
    064ab676777a86074de2c69e1b2002b86c528e38 270 lines 17396 B /home/bibby/docker/xls-csv/data/csvkit.csv
    705906151e545df8fb847e588d88f0266a42a115 270 lines 17395 B /home/bibby/docker/xls-csv/data/libreoffice.csv
    ada720c9636fffe4f2ec40524bbb65e1a79d4630 270 lines 17397 B /home/bibby/docker/xls-csv/data/ssconvert.csv
    00a44129ea3f1ab17fedd7cae8cf4ed62c52b443 270 lines 17401 B /home/bibby/docker/xls-csv/data/unoconv.csv
    13112cfaf0e970277e16643cf35019a73c597f80 270 lines 20311 B /home/bibby/docker/xls-csv/data/xlsx2csv.csv
