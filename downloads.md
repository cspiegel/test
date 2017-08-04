---
title: Bocfel downloads
---
## Bocfel Downloads

The source code for Bocfel is provided here.

Latest version: 0.9

### Bocfel 0.9

[bocfel-0.9.tar.gz](downloads/bocfel-0.9.tar.gz?raw=true)

Release date: March 19, 2017

Release notes:
* UTF-8 is now used for all transcripts and command scripts. 
* Watchpoints can now be set through the debugging interface. 
* The upper window now tracks resizes properly even when it is closed. 

### Bocfel 0.6.3.2

[bocfel-0.6.3.2.tar.gz](downloads/bocfel-0.6.3.2.tar.gz?raw=true)

Release date: December 16, 2014

Release notes:
* Fix detection of *Sherlock* version 26-880127. 

### Bocfel 0.6.3.1

[bocfel-0.6.3.1.tar.gz](downloads/bocfel-0.6.3.1.tar.gz?raw=true)

Release date: June 13, 2014

Release notes:
* Fix a potential use of uninitialized variable. 

### Bocfel 0.6.3

[bocfel-0.6.3.tar.gz](downloads/bocfel-0.6.3.tar.gz?raw=true)

Release date: February  2, 2014

Release notes:
* Improved handling of abbreviations (x, g, z, and o). 
* The “attribute 48” bug of *Sherlock* is now properly handled. 
* Blorb sounds are now properly loaded if the story file itself is wrapped in a Blorb file. 
* Support for “debugging” meta commands, the main use of which is to help find cheats without needing to know details of the Z-machine architecture. 

### Bocfel 0.6.2

[bocfel-0.6.2.tar.gz](downloads/bocfel-0.6.2.tar.gz?raw=true)

Release date: December  1, 2012

Release notes:
* Enable `/undo` in V5 games which do not support undo (e.g. *Hitchhiker’s Guide*). 
* Add new meta commands `/say` (allowing text strings which begin with / to be sent to the game) and `/disable` (which disables meta commands for the rest of the game session). 
* Add new meta commands `/ps` and `/pop` which allow in-memory saves to be created, providing arbitrary save points. 
* Meta commands are no longer included in transcripts. 

### Bocfel 0.6.1

[bocfel-0.6.1.tar.gz](downloads/bocfel-0.6.1.tar.gz?raw=true)

Release date: February 27, 2012

Release notes:
* Bocfel is now dual-licensed under both the GPLv2 and GPLv3. 
* Small bugfixes and general cleanup. 

### Bocfel 0.6.0

[bocfel-0.6.0.tar.gz](downloads/bocfel-0.6.0.tar.gz?raw=true)

Release date: June 26, 2011

Release notes:
* The configuration options `script_on` and `script_name` have been renamed to `record_on` and `record_name`. 
* Support for some meta commands (`/undo`, `/replay`, etc.) has been added. 
* Assorted minor bugfixes and features. 

### Bocfel 0.5.5

[bocfel-0.5.5.tar.gz](downloads/bocfel-0.5.5.tar.gz?raw=true)

Release date: April 22, 2011

Release notes:
* Preliminary `@sound_effect` support. 
* Small bugfixes and general cleanup. 

### Bocfel 0.5.4

[bocfel-0.5.4.tar.gz](downloads/bocfel-0.5.4.tar.gz?raw=true)

Release date: March 25, 2011

Release notes:
* Fix a rather obscure bug triggered when `@restart` is called inside an interrupt. 
* Improved resilience in the face of utterly broken story files. 
* Minor improvements to the syntax for cheats. 
* Improved handling of the configuration file on Windows. 

### Bocfel 0.5.3

[bocfel-0.5.3.tar.gz](downloads/bocfel-0.5.3.tar.gz?raw=true)

Release date: March  9, 2011

Release notes:
* The initial random seed can now be read from a device such as `/dev/random`. 
* Support for Z-machine versions 1 and 2 is now built unconditionally. 
* Small bugfixes and general cleanup. 

### Bocfel 0.5.2

[bocfel-0.5.2.tar.gz](downloads/bocfel-0.5.2.tar.gz?raw=true)

Release date: February 22, 2011

Release notes:
* Fix a display problem when a newline is printed at the right edge of the upper window. 
* Provide better diagnostics when a save file cannot be loaded. 

### Bocfel 0.5.1

[bocfel-0.5.1.tar.gz](downloads/bocfel-0.5.1.tar.gz?raw=true)

Release date: February 18, 2011

Release notes:
* Bocfel now reports itself as a Standard 1.1-compliant interpreter. 
* The stack is now properly saved in a `@save_undo` call. 
* Bocfel generates error messages on a few rather questionable uses of the Z-machine; some of these instances have been modified to return sensible results instead of aborting. 
* The praxix and strictz tests are now passed. 

### Bocfel 0.5.0

[bocfel-0.5.0.tar.gz](downloads/bocfel-0.5.0.tar.gz?raw=true)

Release date: February 15, 2011

Release notes:
* Initial release 
