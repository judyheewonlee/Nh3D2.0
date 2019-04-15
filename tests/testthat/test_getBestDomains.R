# test_getBestDomains.R
# Author: Heewon (Judy) Lee <https://orcid.org/0000-0002-1134-6758>
# This is a validation test for getBestDomains() and Nh3D2.0
#
context("getBestDomains")

# ==== BEGIN SETUP AND PREPARE =================================================
#

#Skip this test on travis and CRAN, times out due to long computations
testthat::skip_on_travis()
testthat::skip_on_cran()

# Create the cath data frame
cathTable <- generateCathTable()

# Create a manual entry of the expected output
# By looking over the entries in the topology
# group 1.10.220.10 I calculated the Rank of 
# the group manually based off my ranking system in the function.
# Note that the first two entries are missing Rfactors but have
# a significantly better resolution and stereochemical value than 
# the third entry.

# The third entry has all entries, but is not as good in resolution
# and stereochemical validation scoring.

testDF <- data.frame(ID = c("2ii2A04", "2ii2A01", "2hyvA04"),
                     PDB = c("2ii2", "2ii2", "2hyv"),
                     V2 = c("1", "1", "1"),
                     V3 = c("10", "10", "10"),
                     V4 = c("220", "220", "220"),
                     V5 = c("10", "10", "10"),
                     Length = c("79", "69", "74"),
                     Resolution = c("1.1", "1.1", "1.42"),
                     Sequence = c("APARAVAYAFHSAVETQNDDMAYEQAARITGLFHDLHKFAWVHYACWGVMRDDILSRFQSKEANKVNFRDACLMFWKLAK",
                                  "GPLGSYGDAIPEVKAILEAKNEEELVTFTSRWSAEERKELRTQFQDTTGLEFIAFLKKCIKNGPYEDVMALGWD",
                                  "KPLYFADRLYDSMKGKGTRDKVLIRIMVSRSEVDMLKIRSEFKRKYGKSLYYYIQQDTKGDYQKALLYLCGGDD"),
                     Class = c("1", "1", "1"),
                     Architecture = c("1.10", "1.10", "1.10"),
                     Topology = c("1.10.220", "1.10.220", "1.10.220"),
                     Homology = c("1.10.220.10", "1.10.220.10", "1.10.220.10"),
                     Rfree = c(NA, NA, "0.223"),
                     RWork = c(NA, NA, 0.183),
                     RObserved = c(NA, NA, 0.1869),
                     Clashscore = c("3.21", "3.21", "6.26"),
                     Ramachandran = c("0.00", "0.00", "0.33"),
                     RSRZ = c("1.64", "1.64", "4.22"),
                     Sidechain = c("0.00", "0.00", "1.85"),
                     Rank = c(1.0, 2.0, 4.5),
                     stringsAsFactors = FALSE)

row.names(testDF) <- c("1", "2", "10")

# Call Nh3D and getBestDomains

selCathTable <- Nh3D(cathTable, 1, 10, 220, 10)

# Call getBestDomains

selCathTable <- getBestDomains(selCathTable)

# Just changing row names to match
row.names(selCathTable) <- c("1", "2", "10")

#
# ==== END SETUP AND PREPARE ===================================================

test_that("corrupt input generates errors",  {
  expect_error(getBestDomains())
})

# CAUTION: this test sets the RNG seed.
test_that("a sample input produces the expected output",  {
  expect_equal(testDF, selCathTable)
})


# ==== BEGIN TEARDOWN AND RESTORE ==============================================
# Remove every persistent construct that the test has created, except for
# stuff in tempdir().

# re-initialize RNG seed
set.seed(NULL)


#
# ==== END  TEARDOWN AND RESTORE ===============================================
#[END]