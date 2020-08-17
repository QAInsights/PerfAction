#!/bin/bash
echo "This is in test.sh"
docker run jmeter -n -t ./examples/CSVExample.jmx -l mylog.log
cat mylog.log