#!/usr/bin/env bash

# create bin directory if it doesn't exist
if [ ! -d "../bin" ]
then
    mkdir ../bin
fi


# delete output from previous run
if [ -e "./ACTUAL.TXT" ]
then
    rm ACTUAL.TXT
fi

# delete buffer.txt from previous run, this one was created based on last run
if [ -e "./buffer.TXT" ]
then
    rm buffer.TXT
fi

# compile the code into the bin folder, terminates if error occurred -d ../bin ../src/main/java/duke/*.java
if ! javac -cp ../src/main/java -Xlint:none -d ../bin ../src/main/java/duke/*.java ../src/main/java/duke/UI/*.java ../src/main/java/duke/Tasklist/*.java ../src/main/java/duke/Storage/*.java ../src/main/java/duke/Exception/*.java ../src/main/java/duke/command/*.java
then
    echo "********** BUILD FAILURE **********"
    exit 1
fi

# run the program, feed commands from input.txt file and redirect the output to the ACTUAL.TXT
java -classpath ../bin duke.Duke <input.txt> ACTUAL.TXT

# convert to UNIX format
cp EXPECTED.TXT EXPECTED-UNIX.TXT
dos2unix ACTUAL.TXT EXPECTED-UNIX.TXT

# compare the output to the expected output
diff ACTUAL.TXT EXPECTED-UNIX.TXT
if [ $? -eq 0 ]
then
    echo "Test result: PASSED"
    exit 0
else
    echo "Test result: FAILED"
    exit 1
fi
