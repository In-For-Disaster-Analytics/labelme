#!/bin/bash
set -xe

cd ${_tapisExecSystemInputDir}
python /code/main.py billing.csv ${_tapisExecSystemOutputDir}/output.txt