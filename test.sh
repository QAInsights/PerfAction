#!/bin/bash
echo "This is in test.sh"
docker run jmeter -v /home/runner/work/PerfAction/PerfAction:/home/runner/work/PerfAction/PerfAction -n -t ./bin/examples/CSVSample.jmx -l mylog.log
echo $(pwd)
docker ps