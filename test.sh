#!/bin/bash
echo "This is in test.sh"
docker run --name jmeter -n -t ./examples/CSVExample.jmx -l mylog.log
cat mylog.log