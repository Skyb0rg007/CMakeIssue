#!/bin/bash

(
    mkdir proj1/build
    cd proj1/build || exit
    cmake ..
    cmake --build . --target install
)

(
    mkdir proj2/build
    cd proj2/build || exit
    echo "###### Running cmake #######"
    cmake ..
    echo "###### Running cmake again #######"
    cmake ..
)

rm -r proj1_install/ proj1/build proj2/build
