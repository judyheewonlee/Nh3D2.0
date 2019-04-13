# SampleScript.R
#
# Package Nh3D2.0
# Purpose: Non-Homologous protein dataset based off the CATH database. 
# A BCB430 course project
# Version: 1.0.0
# Version history: 1.0.0
# Date: March 24 2019
# Author: Heewon Lee (heewon.lee@mail.utoronto.ca)
# License: MIT
#
#  Output: A dataframe containing the best representative PDB domains in each
#  homology group according to the CATH database.
#  Dependencies: BiocManager, Biostrings, msa
#


#### =========== DATA SETUP ================== ####

# In order to first start using Nh3D, we must 
# set up the data by generating the cathTable.
# Use the function generateCathTable() in order to
# create the table.

cathTable <- generateCathTable()

# The cathTable contains the protein domains in 
# each CATH identifier

#### =========== DATA UPDATE ================= ####

# In order to update the cathTable and the data
# directly from the CATH database, the user 
# may call the updateCath() function to update
# and/or create a new cathTable.

cathTable <- updateCath()


#### ========= VIEWING CATH IDENTIFIERS ======= ####

# If the user would like to retrieve some basic
# description and identifier for particular
# protein domains in the CATH database, they may
# generate a data frame containing the protein name, 
# identifier and description

cathKeys <- generateCathKeyDF(cathTable)

(cathKeys)

# If you would like to retrieve a particular topology group
# description

# Assume we would like to see the topology group
# with the 1.10.220 identifier

topologyID <- "1.10.220"
cathKeys$Topology[topologyID == cathKeys$Topology$TopologyID,]

# Description states that this group is part of Annexin V, domain 1


#### ======== RETRIEVING THE NON HOMOLOGOUS DATASET ======= ####

# Assume we want to now retrieve the non-homologous protein
# domains in the topology group from the previous example.

cID <- 1
aID <- 10
tID <- 220

selCathTable <- Nh3D(cathTable, class = cID, architecture = aID, tID = 220)

(selCathTable)


# The resulting data frame will contain protein domains that fall under the
# topology group according to the cath database. There are several 
# annotations included in each entry, most importantly the ranking of
# each protein domain. 

getBestDomains(selCathTable, n = 10)

# We retrieve the top 10 representative domains within the selected
# group



# [END]




