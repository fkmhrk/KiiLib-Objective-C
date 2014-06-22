#!/bin/sh

xcodebuild -sdk iphonesimulator
xcodebuild -sdk iphoneos

lipo -create build/Release-iphoneos/libKiiLib-Objective-C.a build/Release-iphonesimulator/libKiiLib-Objective-C.a -output build/libKiiLib.a
 
