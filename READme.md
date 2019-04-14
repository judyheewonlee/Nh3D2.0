## Nh3D 2.0

###  Non-Homologous 3D Dataset

-----------------------------------------------

Version: 2.0  
Author: Judy Heewon Lee (heewon.lee@mail.utoronto.ca)  
Versions: 2.0 Recreating the Nh3D dataset

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

### About the package

Nh3D2.0 is a non-homologous 3D protein dataset containing the best 
representatives for each homology group referenced by the CATH database.
It accesses the [CATH](http://www.cathdb.info/) database and the data
files in order to determine the best representatives in each architecture, 
topology or homology group. 

Below is a diagram of the package workflow:

![](./inst/img/Nh3D2.0Workflow.jpg?sanitize=true "Nh3D2.0 Package Workflow")


Note: Tandem repeat determination in the protein sequences still needs to 
be implemented and will be completed in future updates.

This read me will go through a sample script in how to use the package.
Please refer to the package **vignette** for indepth explanations and details 
of the package!

&nbsp;

----

#### In this package...
&nbsp;

```text
--Nh3D2.0/
|__.gitignore
|__.Rbuildignore
|__.travis.yml
|__Nh3D2.0.Rproj
|__DESCRIPTION
|__inst/
    |__img/
        |__[...]                  # image sources for .md document
    |__scripts/
        |__sampleScript.R         #Sample script
        |__README-cath-list-file-format.txt     #Data file formats from CATH
|__NAMESPACE
|__R/
    |__addCathCat.R
    |__addRfactor.R
    |__addValidation.R
    |__fetchCathData.R
    |__fetchRFactor.R
    |__fetchVerifyData.R
    |__fixMissingRValues.R
    |__generateCathKeyDF.R
    |__generateCathTable.R
    |__getBestDomains.R
    |__Nh3D.R
    |__readCathData.R
    |__readCathNames.R
    |__readXML.R
    |__refineCathTable.R
    |__removeLowestResolution.R
    |__updateCath.R
    |__weightHomologies.R
|__README.md                    # this file
|__vignettes/
   |__Nh3D2.0Vignette.Rmd       #Vignette file
|__man/
   |__[...]         #ROxygen man files, do not edit

```

&nbsp;

----

&nbsp;

### 1.Data Setup

&nbsp;

In order to first start using Nh3D, we must set up the data by 
generating the cathTable.Use the function generateCathTable() in order to 
create the table.

```R
cathTable <- generateCathTable()

```

The cathTable contains the protein domains in each CATH identifier

&nbsp;

### 2. Data Update

&nbsp;

In order to update the cathTable and the data directly from the CATH database, 
the user may call the **`updateCath()`** function to update and/or 
create a new cathTable.

```R
cathTable <- updateCath()
```

&nbsp;

### 3. Viewing CATH Identifiers and descriptions

&nbsp;

If the user would like to retrieve some basic description and 
identifier for particular protein domains in the CATH database, they may 
generate a data frame containing the protein name, identifier 
and description.

```R
cathKeys <- generateCathKeyDF(cathTable)

(cathKeys)
```

Below is an image of the relational data model for the CATH Key datatable.
Since there is a hierarchy where Class > Architecture > Topology > Homology,
a relational datamodel was made to display and access the data.

![](./inst/img/Nh3D2.0KeyModel.jpg?sanitize=true "Nh3D2.0 CATH Key Data Model")

The code below retrieves a particular topology group
description, name and CATH identifier. 
Assume we would like to see the topology group with the 
**1.10.220** identifier

```R
topologyID <- "1.10.220"
cathKeys$Topology[topologyID == cathKeys$Topology$TopologyID,]
```

This returns the data row containing the name, description and 
CATH identifier. The description states that this group 
is part of **Annexin V, domain 1**.

&nbsp;

### 4.Retrieving the Non-homologous Dataset

&nbsp;

Assume we want to now retrieve the non-homologous protein
domains in the topology group from the previous example.

```R
cID <- 1
aID <- 10
tID <- 220

selCathTable <- Nh3D(cathTable, class = cID, architecture = aID, tID = 220)

(selCathTable)
```

The resulting data frame will contain protein domains that fall under the 
topology group according to the cath database. There are several 
annotations included in each entry, most importantly the ranking of
each protein domain. 

```R
getBestDomains(selCathTable, n = 10)
```

We retrieve the top 10 representative domains within the selected group.
With the ten representatives, we get the **PDB ID's** of each domain, 
the **length of the sequence**, **Resolution**, **Rfactors**, **Stereochemical**
**Validation Scores**, and the **Rank**.

&nbsp;

### Notes and References

&nbsp;

1. [Nh3D: A reference dataset of non-homologous protein structures](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1182382/)

This was the original Nh3D program that was created in 2005 for C.
This source was used as a basic outline as to how Nh3D2.0 should be developed.
Unfortunately, the original Nh3D program is unavailable for use.

2. [R Package Structure](http://r-pkgs.had.co.nz/)

This package follows the structure and guidelines to R packages building
by Hadley Wickham.

3. [Tandem Repeats in Proteins: Prediction Algorithms and Biological Role](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4585158/)

This source links many different tandem repeat finder algorithms that
may be useful for future updates in Nh3D2.0. 

4. [CATH: comprehensive structural and functional annotations for genome sequences](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4384018/)

This is the official publication for the CATH database which is used as a reference
database in the Nh3D2.0 package.

5. [A tutorial on multiobjective optimization: fundamentals and evolutionary methods](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6105305/)

Multi-objective optimization is a statiscal approach utilized in the Nh3D2.0 package
in order to determine the weighting/ranking of the protein domains in each group.

&nbsp;

### Further reading

- [CATH database info](http://www.cathdb.info/wiki)
- [PDB101 - Resolution](https://pdb101.rcsb.org/learn/guide-to-understanding-pdb-data/resolution)
- [PDB101 - Rfactors](https://pdb101.rcsb.org/learn/guide-to-understanding-pdb-data/r-value-and-r-free)
- The [RStudio R markdown reference guide](https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)


### Acknowledgements

User `Ben Bolker` [posted on Stack](https://stackoverflow.com/questions/7060272/split-up-a-dataframe-by-number-of-rows) how to  split a dataframe by a distinct amount of rows.

&nbsp;

<!-- [END] -->



