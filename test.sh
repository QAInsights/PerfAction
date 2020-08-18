#!/bin/bash
echo "This is in test.sh"
docker run --interactive --tty --rm --volume `pwd`:/jmeter egaillardon/jmeter --nongui --testfile CSVSample.jmx --logfile result.jtl
echo $(pwd)
docker ps -a