## Nh3D 2.0

###  Non-Homologous 3D Dataset

-----------------------------------------------

Version: 2.0  
Author: Judy Heewon Lee (heewon.lee@mail.utoronto.ca)  
Versions: 2.0 Recreating the Nh3D dataset

-----------------------------------------------

----------------------------------------------
This package follows the structure and process 
suggested by Hadley Wickham in:


  R Packages
  http://r-pkgs.had.co.nz/

-----------------------------------------------

Some useful keyboard shortcuts for package authoring:

Build and Reload Package:  'Cmd + Shift + B'  
Update Documentation:      'Cmd + Shift + D' or devtools::document()  
Check Package:             'Cmd + Shift + E'  

-----------------------------------------------

Load the package with:  
   devtools::install_github("judyheewonlee/Nh3D2.0")
   
-----------------------------------------------
   
### Installation instructions before running Nh3D2.0 

If you would like the most updated version of the CATH table
and Nh3D2.0 or wouldl ike to install the database manually
using the Nh3D() function in the package, the validation report
files must be installed before hand.

To install, the following steps need to be taken:

1. Install wget in the console
2. Use wget to install file directories for structure validation 
reports from ftp://ftp.wwpdb.org/pub/pdb/validation_reports

#### Installing wget for mac

The following stackoverflow page contains the instructions for 
installing wget on Mac OS: 
https://stackoverflow.com/questions/33886917/how-to-install-wget-in-macos

Users that are using the Windows OS should automatically have wget integrated in
the operating system.


#### Installing structure validation reports

Once '''wget''' is installed onto the system, you can run the following
command on the console:

'''
wget -r -np -nH -k -A ".xml.gz" ftp://ftp.wwpdb.org/pub/pdb/validation_reports
'''

**-r** command is used to retrieve files recursively.
**-np** command skips parent directories
**-nH** command skips host directories
**-k** command skips files that may have been installed already
**-A ".xml.gz"** command is used to only install the files with the 
.xml.gz extension

Note that this is done manually due to retrieving the files online through
Rstudio is highly extensive and can take up to hours, usually timing out before
completion. Therefore, installing it manually reduces the amount of time taken 
in order to retrieve validation data in R.

