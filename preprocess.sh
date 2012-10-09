#!/bin/sh
#
# Trivial #include pre-processor
#
# Usage: preprocess.sh <file>
#
# Replace #include statements in <file> with the verbatim
# content of the included file. Output is written to stdout.
# Works recursively (#include in included files are also
# processed).

SRC=$1
if [ -z "$SRC" ] ; then
  echo "Usage: $0 <filename>"
  exit 1
fi
SRCDIR=$(dirname $SRC)

IFS=$'\n'
cat $SRC | while read line ; do
  case "$line" in
    \#include*)
       LINE=$(($LINE+1))
       file=$(echo "$line" | sed 's/#include *"\(.*\)"/\1/')
       echo "// > #include \"$file\" ($SRC:$LINE)"
       $0 $SRCDIR/$file || exit $?
       echo "// < #include \"$file\" ($SRC:$LINE)"
       ;;
    *)
       LINE=$(($LINE+1))
       echo "$line"
       ;;
  esac
done

