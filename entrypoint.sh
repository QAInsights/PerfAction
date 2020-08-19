#!/bin/sh
echo "Execution is being started"
echo "**************************"
jmeter $@
echo "Execution has been completed, please check the artifacts to download the results."
echo "**************************"