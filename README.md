# What is this?

This repo contains a fairly simple example of creating a DLL using Go
and MinGW. There are helper scripts for Linux and Windows that will
setup the ENV and put compiled artifacts in the `build` folder.

The top-level example uses a C header file for lower-level control
over the DLL (process attach/detach). The `redteam` directory contains
stripped down code (no C) that will run your payload but doesn't allow
for the same level of control.

**Note:** This is merely an example. If you need additional
functionality (e.g. mutex to prevent multiple executions), that's an
exercise left for you.
