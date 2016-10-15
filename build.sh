#!/bin/bash

rm -rf .build
rm -rf Packages
rm -rf libxml2/.git
cd libxml2
./config.sh
cd ..

swift build -Xcc -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/libxml2/