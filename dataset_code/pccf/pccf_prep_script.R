# PCCF processing script, for June 2003 postal codes, 2001 Census
# source files at https://hdl.handle.net/11272.1/AB2/QA758U
# script assumes source files are in R working directory:
#
#   - pccf59_JUN03_fccp59.txt
#   - fed02.dat
#   - cd02.dat
#   - sac03.dat

# install readr package
install.packages("readr")

# load readr for use
library(readr)

# read pccf data file and parse into columns based on 'record layout' on p13 of PCCF reference guide
# store output as 'formatted_pccf'

formatted_pccf <- read_fwf(
  "pccf59_JUN03_fccp59.txt",
  fwf_widths(
    c(6,3,8,2,9,11,1,2,4,3,70,3,3,3,1,7,2,4,5,4,1,1,1,30,1,1,8,8),
    c("Postal Code", "FSA", "DAuid", "Block", "Lat", "Long", "SLI", "PR",
      "CDuid", "CSD", "CSDname", "CSDtype", "CCS", "SAC", "SACtype", "CTname",
      "ER", "DPL", "FED96uid", "UARA", "UARAtype", "Rep_Point", "PCtype",
      "Comm_Name", "DMT", "H_DMT", "Birth_Date", "Ref_Date")))

# import and format label files

FED96 <- read_fwf(
  "fed02.dat",
  fwf_widths(
    c(5,100),
    c("FED96uid", "FED96name")))

SAC <- read_fwf(
    "sac02.dat",
  fwf_widths(
    c(3,100),
    c("SAC", "SACname")))

CD <- read_fwf(
  "cd02.dat",
  fwf_widths(
    c(4,100),
    c("CDuid", "CDname")))

# merge to add labels

tmp_pccf_1 <- merge (
  formatted_pccf, 
  FED96, 
  by="FED96uid", 
  all.formatted_pccf=TRUE, 
  all.FED96=FALSE
)

tmp_pccf_2 <- merge (
  tmp_pccf_1,
  SAC,
  by="SAC",
  all.tmp_pccf_1=TRUE,
  all.SAC=FALSE
)

pccf_with_labels <- merge (
  tmp_pccf_2,
  CD,
  by="CDuid",
  all.tmp_pccf_2=TRUE,
  all.SAC=FALSE
)

## save merged and formatted data as .csv

write.csv(pccf_with_labels,"pccf_with_labels.csv")
