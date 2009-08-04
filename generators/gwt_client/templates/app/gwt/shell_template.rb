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

# Defaults to running at localhost:3000
if [ $GWT_PORT = '' ]
then
    GWT_PORT=3000
fi

# Specify our classpaths and included jars
SRCDIR="$CURDIR/src/<%= file_name.downcase %>"
REQUIRED_LIBS="$CURDIR/src:$CURDIR/bin:$GWT_HOME/gwt-user.jar:$GWT_HOME/$GWT_OS_JAR"
VENDOR_LIBS="$CURDIR/lib/gwt-rest.jar:$CURDIR/lib/gwtx-1.5.2.jar" # append additional entries here

# Run the GWT Compiler
java $GWT_FLAGS -Xmx256M -classpath "$REQUIRED_LIBS:$SRCDIR:$VENDOR_LIBS" com.google.gwt.dev.HostedMode -war "$ROOTDIR/public/gwt" -gen "$ROOTDIR/public/gwt" "$@" -noserver -port $GWT_PORT <%= file_name %>;