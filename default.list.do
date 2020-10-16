redo-always
find $2 -type f -name "*.txt" | sort > $3
redo-stamp <$3