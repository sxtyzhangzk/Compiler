# this script is called when the judge wants our compiler to compile a source file.
# print the compiled source, i.e. asm code, directly to stdout.
# don't print anything other to stdout.
# if you would like to print some debug information, please go to stderr.
# $1 is the path to the source file.
# $2 is the path to the target file.

set -e
cd "$(dirname "$0")"
export CCHK="java -classpath ./lib/antlr-4.7.1-complete.jar:./bin Compiler.Main"
cat > program.txt   # save everything in stdin to program.txt

$CCHK

sed -n '2122p;2722p;2913p' program.asm 1>&2
cat program.asm

