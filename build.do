redo-ifchange list
SOURCES="$(cat list)"
echo $SOURCES | xargs redo-ifchange

echo "Running build with side-effects" >&2
for f in $SOURCES; do
    touch "${f%.txt}.output"
done

redo-ifchange `ls *.output`