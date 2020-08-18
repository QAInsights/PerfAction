#!/bin/bash
echo "This is in test.sh"
docker run -d jmeter -n -t ./bin/examples/CSVSample.jmx -l mylog.log
echo $(pwd)
docker ps -a