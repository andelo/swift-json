XCODE = Xcode6-Beta5
SWIFT_CMD = /Applications/${XCODE}.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift
SWIFT_C = ${SWIFT_CMD}c
MACOSX_SDK = /Applications/${XCODE}.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk 
SWIFT_FLAGS = -emit-library -emit-object
export PATH := ${MACOSX_SDK}:$(PATH)

# Todo: figure out how to link with a library
test: build
	@$(SWIFT_C) -sdk ${MACOSX_SDK} json.swift main.swift
	./main

build: 
	$(SWIFT_C) ${SWIFT_FLAGS} json.swift -sdk ${MACOSX_SDK} -module-name JSON
	ar rcs libJSON.a json.o

.PHONY: test