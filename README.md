# What is this?

This repo contains a fairly simple example of creating a DLL using Go
and MinGW. Simply run `make` to compile. Artifacts will be in the
`build` folder. There are also scripts in `tools`, if you don't want
to use `make`.

The top-level example uses a C header file for lower-level control
over the DLL (process attach/detach). The `redteam` directory contains
stripped down code (no C) that will run your payload but doesn't allow
for the same level of control.

**Note:** This is merely an example. If you need additional
functionality (e.g. mutex to prevent multiple executions), that's an
exercise left for you. Additionally, while there exist exports to use
with `regsvr32` and `rundll`, it is recommended to remove what you
don't need and add exports unique to your use-case.
