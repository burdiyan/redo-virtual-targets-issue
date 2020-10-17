## Background

This is a simpler example that is similar to what `master` branch shows.

## Steps To Reproduce

1. Clone repo.
2. `redo` - runs build.
3. `redo` multiple times - doesn't run build.
4. `touch 1.txt`, then `redo` multiple times - builds only once.
5. `touch 2.txt`, then `redo` multiple times - builds twice.
6. `rm 1.output`, then `redo` multiple times - builds only once.
7. `rm 2.output`, then `redo` multiple times - builds twice.

## Proposed Solution

What if there were a way for a rule to explicitly declare its outputs? Like `redo-ifchange` there could be `redo-output` (or similar) that would mark the indicated files as static, but generated, and add them as a dependency for the rule running `redo-output`.

I still don't quite understand what static files are in the redo world though :) But I've tested it and it seems to work.

It would be super cool if you could be able to run `redo-output` before or after outputs are actually built. The parent process would check if the outputs were generated after the rule is executed. If some of the previously declared outputs disappear - then the rule is marked as dirty.

I'm pretty sure this idea would have lots of implications, that I'm not aware of, but I find the idea of explicitly declaring outputs pretty elegant. It's a bit like Bazel - but with simplicity, imperativity and dynamism of `redo`.
