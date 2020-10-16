redo-ifchange $2.list
cat $2.list | xargs redo-ifchange

cd $2

echo "Running build with side-effects" >&2
bash -c 'mkdir -p dist && touch dist/fake-output'

redo-ifchange dist/fake-output
