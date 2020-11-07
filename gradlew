#!/usr/bin/env bash

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

APP_NAME="Gradle"
# shellcheck disable=SC2006
APP_BASE_NAME=`basename "$0"`

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn ( ) {
    echo "$*"
}

die ( ) {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
# shellcheck disable=SC2006
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    # shellcheck disable=SC2034
    msys=true
    ;;
esac

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    # shellcheck disable=SC2006
    ls=`ls -ld "$PRG"`
    # shellcheck disable=SC2006
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        # shellcheck disable=SC2006
        PRG=`dirname "$PRG"`"/$link"
    fi
done
# shellcheck disable=SC2006
SAVED="`pwd`"
# shellcheck disable=SC2164
# shellcheck disable=SC2006
cd "`dirname \"$PRG\"`/" >/dev/null
# shellcheck disable=SC2006
APP_HOME="`pwd -P`"
# shellcheck disable=SC2164
cd "$SAVED" >/dev/null

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    # shellcheck disable=SC2230
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Increase the maximum file descriptors if we can.
# shellcheck disable=SC2166
if [ "$cygwin" = "false" -a "$darwin" = "false" ] ; then
    # shellcheck disable=SC2006
    MAX_FD_LIMIT=`ulimit -H -n`
    # shellcheck disable=SC2181
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
            MAX_FD="$MAX_FD_LIMIT"
        fi
        ulimit -n "$MAX_FD"
        if [ $? -ne 0 ] ; then
            warn "Could not set maximum file descriptor limit: $MAX_FD"
        fi
    else
        warn "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
    fi
fi

# For Darwin, add options to specify how the application appears in the dock
if $darwin; then
    GRADLE_OPTS="$GRADLE_OPTS \"-Xdock:name=$APP_NAME\" \"-Xdock:icon=$APP_HOME/media/gradle.icns\""
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    # shellcheck disable=SC2006
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    # shellcheck disable=SC2006
    CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`
    # shellcheck disable=SC2006
    JAVACMD=`cygpath --unix "$JAVACMD"`

    # We build the pattern for arguments to be converted via cygpath
    # shellcheck disable=SC2006
    ROOTDIRSRAW=`find -L / -maxdepth 1 -mindepth 1 -type d 2>/dev/null`
    SEP=""
    for dir in $ROOTDIRSRAW ; do
        ROOTDIRS="$ROOTDIRS$SEP$dir"
        SEP="|"
    done
    OURCYGPATTERN="(^($ROOTDIRS))"
    # Add a user-defined pattern to the cygpath arguments
    if [ "$GRADLE_CYGPATTERN" != "" ] ; then
        OURCYGPATTERN="$OURCYGPATTERN|($GRADLE_CYGPATTERN)"
    fi
    # Now convert the arguments - kludge to limit ourselves to /bin/sh
    i=0
    for arg in "$@" ; do
        # shellcheck disable=SC2196
        # shellcheck disable=SC2006
        CHECK=`echo "$arg"|egrep -c "$OURCYGPATTERN" -`
        # shellcheck disable=SC2196
        # shellcheck disable=SC2006
        CHECK2=`echo "$arg"|egrep -c "^-"`                                 ### Determine if an option

        if [ "$CHECK" -ne 0 ] && [ "$CHECK2" -eq 0 ] ; then                    ### Added a condition
            # shellcheck disable=SC2046
            # shellcheck disable=SC2006
            # shellcheck disable=SC2116
            eval `echo args$i`=`cygpath --path --ignore --mixed "$arg"`
        else
            # shellcheck disable=SC2046
            # shellcheck disable=SC2116
            # shellcheck disable=SC2006
            eval `echo args$i`="\"$arg\""
        fi
        i=$((i+1))
    done
    case $i in
    esac
fi

# Split up the JVM_OPTS And GRADLE_OPTS values into an array, following the shell quoting and substitution rules
function splitJvmOpts() {
    JVM_OPTS=("$@")
}
# shellcheck disable=SC2153
eval splitJvmOpts $DEFAULT_JVM_OPTS "$JAVA_OPTS" "$GRADLE_OPTS"
JVM_OPTS[${#JVM_OPTS[*]}]="-Dorg.gradle.appname=$APP_BASE_NAME"

exec "$JAVACMD" "${JVM_OPTS[@]}" -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
