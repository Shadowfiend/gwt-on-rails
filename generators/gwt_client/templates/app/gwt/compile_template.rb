#!/bin/sh
CURDIR=`dirname $0`;
ROOTDIR="$CURDIR/../../../"

# Determine our OS specific gwt jar file
OS_TYPE=`uname`
if [ $OS_TYPE = 'Linux' ]
then
    GWT_FLAGS=''
    GWT_OS_JAR='gwt-dev-linux.jar'
else
    GWT_FLAGS='-XstartOnFirstThread'
    GWT_OS_JAR='gwt-dev-mac.jar'
fi

# Specify our classpaths and included jars
REQUIRED_LIBS="$CURDIR/src:$CURDIR/bin:$GWT_HOME/gwt-user.jar:$GWT_HOME/$GWT_OS_JAR"
VENDOR_LIBS="$CURDIR/lib/gwt-rest.jar:$CURDIR/lib/gwtx.jar:$CURDIR/lib/jsonwrapper-0.1.jar" # append additional entries here

# Run the GWT Compiler
java $GWT_FLAGS -Xmx256M -classpath "$REQUIRED_LIBS:$VENDOR_LIBS" com.google.gwt.dev.Compiler -war "$ROOTDIR/public/gwt" -gen "$ROOTDIR/public/gwt" "$@" <%= gwt_module %>;