redo-ifchange list
redo-ifchange `cat list`

echo "Running build with side-effects" >&2
touch 1.output 2.output 3.output

redo-ifchange `ls *.output`