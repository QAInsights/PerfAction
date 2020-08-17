#!/bin/bash
echo "This is in test.sh"
docker run jmeter -n -t ./bin/examples/CSVSample.jmx -l ./bin/mylog.log
cat ./bin/mylog.log