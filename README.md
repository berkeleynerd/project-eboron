# Project Eberon

Project Eberon is a collection of software packages designed to help students wishing to learn or extend the _Project Oberon 2013_ system. The word Eberon is a anagram of the Oberon. 

The initial goal of Project Eberon is to pull together useful tools from various other repositories, rationalize their organization, and document how to use them effectively together to obtain, build, and deploy the original _Project Oberon 2013_ sources within an emulated RISC5 environment. 

Stretch goals may include tooling for targeting one or more FPGA systems beyond the original Digilent Spartan 3 platform which has been discontinued. Projects extending the original Project Oberon 2013 system as described by Wirth (see http://www.projectoberon.com as well as https://people.inf.ethz.ch/wirth/ProjectOberon/index.html) such as _Project Oberon Extended_ or targeting other ISAs such as RISC-V are not in scope. 

We will avoid here using *git submodules* or linked references to other repositories on the Internet and instead provide an opinionated distillation of the useful features from each in an attempt to create an easier to understand and use byproduct. 

The end result, I hope, will be to make learning the complete _Project Oberon 2013_ as frictionless as possible (see links above). I hope to accompany this repository with wiki entries organized to allow the student to follow the original Project Oberon 2013 documentation end-to-end with success and without the need for a suitable hardware FPGA platform. 

## Contents

* `Runtime/` RISC5 emulator and operating system interface.
* `Oberon/` Unmodified source code from Project Oberon 2013.
* `Norebo/` Norebo-specific and new modules.
* `Bootstrap/` Pre-compiled modules to bootstrap Norebo.
* `build.sh` Script to rebuild Norebo. See Norebo in action.

## PO2013 image build tools

This repository also contains tools to build fresh PO2013 filesystem
images.  Use it like so:

    ./fetch-sources.py upstream
    ./build-image.py upstream

...where `upstream` is the name of the directory where the sources
should live.  (Replace it with the name of your choice.) This will
download the project sources, compile them, create runnable disk image
`build/Oberon.dsk`.  The CSV build manifest controls which set of
files should define the resulting system.  The disk image can be run
on the [Project Oberon RISC emulator].

Supporting Oberon modules are stored in `Norebo`: a virtual file
system (`VDiskUtil`/`VFile`) and a static linker for the Inner Core.
All this is based on code from PO2013.

## File handling

New files are always created in the current directory. Old files are
first looked up in the current directory and if they are not found,
they are searched for in the path defined by the `OBERON_PATH`
environment variable. Files found via `OBERON_PATH` are always opened
read-only.

## Bugs

Probably many.

Files are not integrated with the garbage collector. If you don't
close a file, it will remain open until Norebo exits.

Most runtime errors do not print a diagnostic message. Here's a table
of exit codes:

 Exit code | Meaning
----------:|:------------------------------
      1..7 | possibly a Modules error
         5 | (also) unknown command
       101 | array index out of range
       102 | type guard failure
       103 | array or string copy overflow
       104 | access via NIL pointer
       105 | illegal procedure call
       106 | integer division by zero
       107 | assertion violated

[Project Oberon RISC emulator]: https://github.com/pdewacht/oberon-risc-emu
