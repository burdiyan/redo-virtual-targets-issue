## Background

1. We have a list of directories and each contains a software package with sources in `src`.
2. Packages are independent from one another.
3. Assume that packages must be built using virtual targets - for whatever reason the build process can't produce a stable output in `$3`.
4. Build produces a `dist` directory with multiple outputs next to our `src` dir inside each package.
5. In this example there's only one such package called `bar`. It's enough to demonstrate the problem.
6. Rule `default.list.do` produces a list of sources then `redo-stamp` it.
7. Rule `default.build.do` depends on the list _rule_ and on each _file_ mentioned in the resulting `*.list` file.
8. The same `default.build.do` rule runs the build, then it `redo-ifchange` one arbitrary build output file inside the `dist` directory, so that we redo if `dist` directory gets deleted somehow. Very similar to LaTex example from the redo cookbook: https://github.com/apenwarr/redo/blob/main/docs/cookbook/latex/default.runtex.do#L51

Problem: `default.build.do` target becomes "dirty" twice when newly introduced inputs change, but it happens only once (which is expected) when the old inputs change.

## Steps To Reproduce

1. Clone repo.
2. `redo all` - make sure `bar.list` was created and `bar/dist/fake-output` as well.
3. `redo all` - no rebuild.
4. `touch bar/src/2.txt`.
5. `redo all` - rebuild.
6. `redo all` again - should NOT rebuild, but rebuilds.
7. `redo all` again several times - now it's not being rebuilt.
8. `touch bar/src/1.txt` then `redo` several times - rebuilds only once. Fine!
9. `touch bar/src/2.txt` then `redo` several times - rebuilds twice. Why?
