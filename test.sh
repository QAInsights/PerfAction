#!/bin/bash
echo "This is in test.sh"
docker run jmeter -it -n -t ./bin/examples/CSVSample.jmx -l mylog.log
echo $(pwd)
docker ps