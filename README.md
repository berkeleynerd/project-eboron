# Project Eberon

Project Eberon is a collection of software packages designed to help students wishing to learn or extend the [_Project Oberon 2013_](http://www.projectoberon.com) system. The original, if less extensive, _Project Oberon 2013_ web-site is also still available at the [ETH Zurich Project Oberon](https://people.inf.ethz.ch/wirth/ProjectOberon/index.html) web-site. In case you were wondering, Eberon is a anagram of Oberon.

The initial goal of Project Eberon is to bring together useful tools from various other repositories, rationalize their organization, simplify their presentation, and document how to use them effectively together to obtain, build, and deploy the original _Project Oberon 2013_ sources within an emulated RISC5 environment. 

Stretch goals may include tooling for targeting one or more FPGA systems beyond the original Digilent Spartan 3 platform which has since been discontinued. Projects extending the original Project Oberon 2013 system as described by Wirth such as _Project Oberon Extended_ or targeting other ISAs such as RISC-V are not in scope. 

We will avoid here using *git submodules* or linked references to other repositories on the Internet and instead provide an opinionated distillation of the useful features from each in an attempt to create an easier to understand and use byproduct. Links to the original and proper credit will, of course, be provided (and maintained) for all included source code, utilities, and documentation to the extent possible.

The end result, I hope, will be to make learning the complete _Project Oberon 2013_ as frictionless as possible (see links above). I hope to accompany this repository with wiki entries organized to allow the student to follow the original _Project Oberon 2013_ documentation from beginning to end with success and without the need for a capable hardware FPGA platform. 

## Contents

### Sources

* `src/Oberon/` Project Oberon 2013 unmodified sources.<sup>3</sup>
* `src/Runtime/` Project Norebo RISC5 emulator and operating system interface.<sup>2</sup>
* `src/Norebo/` Project Norebo new and modified modules allowing headless operation.<sup>2</sup>

### Utilities

* `bin/dos2oberon` Perl script to convert a dos format file to the oberon file format.<sup>1</sup>
* `bin/oberon2dos` Perl script to convert an oberon format file to the dos file format.<sup>1</sup>
* `build-norebo.sh` Script to rebuild Norebo.<sup>2</sup>

### Other

* `obj/Bootstrap/` Pre-compiled modules used to bootstrap Norebo.<sup>2</sup>

## Project Oberon 2013 Image Build Tools

In addition to the original Project Oberon 2013 sources, this repository also contains a tool to build Oberon filesystem images based on a successful build of the `norebo` utility.  Use it like so:

    ./build-norebo.sh
    ./build-image.sh manifest.csv oberon_sources

...where `manifest.csv` is the full path to the file containing the list of sources that will dfine the resulting runnable Oberon system image and `oberon_sources` is the directory path containing the actual sources. By default, these parameters correspond to the values `src/Oberon/manifest.csv` and `src/Oberon` respectively.

The first script compiles the `norebo` binary which the second script uses to produce a functional Oberon system image. This latter artifact can be found at `build/Oberon.dsk`.  The `manifest.csv` file selects the set of files that should define the resulting system.  The resulting disk image can be run using the [Project Oberon RISC emulator].

Supporting Oberon modules are stored in `src/Norebo/`: a virtual file system (`VDiskUtil`/`VFile`) and a static linker for the Inner Core. All this is based on code from PO2013.

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
