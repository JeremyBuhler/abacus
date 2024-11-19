|   |   |
| --- | --- |
| **Dataset name** | Postal Code Conversion File _and_ Postal Code Conversion File Plus  
| **Permanent URL** | There are multiple PCCF/PCCF+ records in Abacus; this <a href="https://abacus.library.ubc.ca/dataverse/abacus/?q=title%3A%22Postal+Code+Conversion+File%22" target="_blank">Abacus search URL</a> will return many of them
| **Data access rules** | Restricted to researchers currently affiliated with SFU, UBC, UNBC, and UVic


Postal Code Conversion Files allow researchers to map postal codes to Census geographies. Data with postal codes can be aggregated to standard geographies for reporting purposes or combined with other data available by Census geography (e.g. census tract, census subdivision). 

!!! note
    PCCF files do not contain any socioeconomic or demographic data themselves, they are just a key for aggregating or combining data files from other sources.  

Postal Code Conversion Files come in two flavours, the **PCCF** and **PCCF+**. Postal Code boundaries do not perfectly match census boundaries: one postal code may span multiple census subdivisions, for example. The PCCF and PCCF+ differ in how they handle this kind of overlap.

> - The PCCF file contains a Single Link Indicator (SLI) field to indicate the geographic area with the majority of dwellings assigned to a particular postal code.
> - The PCCF+ is a SAS program using a population weighted random algorithm to increase accuracy where postal codes span over more than one geographic area
> 
> _from Queen's University Library's [Guide to the PCCF/PCCF+](https://guides.library.queensu.ca/c.php?g=710466&p=5062245)_

## Which PCCF/PCCF+ file should I use?
There are more than 50 PCCF/PCCF+ files in Abacus with different dates. This is because Postal Code and Census geographies change over time. Choose a PCCF/PCCF+ file with a Postal Code date as close as possible to the collection date of the data that contains the Postal Codes. 

## Guides to the PCCF/PCCF+
Queens University Library maintains an excellent guide on PCCF and PCCF+ files, including step-by-step instructions for using the PCCF+ with SAS: <https://guides.library.queensu.ca/PCCF/PCCF>. 

## PCCF helper scripts
Recent PCCF files in Abacus include an SPSS syntax file to parse the data and assigns labels, making it easier to work with. Older PCCF records may only come with data files (e.g. [this 2003 version](https://abacus.library.ubc.ca/dataset.xhtml?persistentId=hdl:11272.1/AB2/QA758U)). 

When no syntax file is available researchers can use other tools to parse the data. The R script below provides an example that can be adapted to other files and contexts.


``` title="pccf_prep_script.R"
--8<-- "dataset_code/pccf/pccf_prep_script.R"
```


The Python script below works with the PCCF (not the PCCF+) to extract a variety of variables of your choice and save them as a tab-separated value (TSV) files

``` title="pccf_data_extractor.py"
--8<-- "dataset_code/pccf/pccf_data_extractor.py"
```

