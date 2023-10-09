#!/bin/bash

/usr/bin/in2csv "${1}" | sed '/^,*$/d' > "${2}"
