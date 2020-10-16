redo-ifchange list
ls *.txt | xargs redo-ifchange

echo "Running build with side-effects" >&2
touch 1.output 2.output 3.output

ls *.output | xargs redo-ifchange
