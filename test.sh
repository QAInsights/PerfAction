#!/bin/bash
echo "This is in test.sh"
docker run jmeter -i -v /:/ -n -t ./bin/examples/CSVSample.jmx -l mylog.log
echo $(pwd)
docker ps