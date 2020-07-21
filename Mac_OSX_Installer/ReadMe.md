This provides a simple installer for [Aeneas](https://github.com/readbeyond/aeneas) for Mac OS X 10.7 and up.  

1. To build this installer for Mac OS X first download (and extract) or clone this repository.  
2. Then open Terminal and _cd_ to _Mac\_OSX\_Installer_
3. Then run *build\_setup.sh* which will install the necessary applications needed for building.
4. Next run *build\_packages.sh* which will then build the sub packages.
5. Finally run *build\_installer.sh* which will then build the main installer.

NOTE: For OS X 10.9 and up the *build\_setup.sh* script will install the Xcode Command Line Tools itself, but  
for OS X 10.7 or 10.8 you will need to download and install Xcode and the Xcode Command Line Tools first.
