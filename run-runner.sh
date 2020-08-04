#!/bin/bash

if [ -z "$TESTOBJECT_API_KEY" ]
then
  echo "TESTOBJECT_API_KEY environment variable not set, exiting."
  exit -1
fi

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <example number>"
  echo "  Ex: $0 1"
  exit -1
fi

EXAMPLE_NUM=$1
APPAPK=./LoanCalc.apk
TESTAPK=./LoanCalc-tests.apk
JAVA_HOME=$(/usr/libexec/java_home --version 11)

java -jar runner.jar config --path runner-ex${EXAMPLE_NUM}.yml --apikey ${TESTOBJECT_API_KEY}
