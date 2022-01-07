|   |   |
| --- | --- |
| **Dataset name** | BC Assessment Data Advice and Inventory Extracts 
| **Permanent URL** | <https://hdl.handle.net/11272.1/AB2/LAPUAB>
| **Data access rules** | Restricted to researchers currently affiliated with UBC

!!! info
    The BC Assessment data in Abacus is currently restricted to UBC users, but other institutions may have access to the data in other forms. Contact your university library for more information. 

## Data format and conversion 
BC Assessment provides data in XML and TXT format. To make the large XML files more accessible to researchers, UBC Library converts each to a series of CSV files and a SQLite database. Both the original files and the transformed versions are available in Abacus. 

The SQLite version is recommended for most users. For those interested in the file conversion, the process to create the SQLite database from the original XML and TXT files is outlined in these files: 

- <a href="../BCA_data_transformation_notes.txt" download>BCA_data_transformation_notes.txt</a> describes the steps involved 
- <a href="../BCA_REVD_stylesheet.xsl" download>BCA_REVD_stylesheet.xsl</a> is the XSLT stylesheet used in the transformation 

## Using the sqlite database
The open source _DB Browser for SQLite_ is a good cross-platform tool for exploring and querying the SQLite version of the BC Assessment data: <https://sqlitebrowser.org>

The database consists of 13 tables. Table and field names correspond to the XML elements and CSV fields described in the BC Assessment user guides available from <https://www1.bcassessment.ca/Support/Guide>.

| Table name | Documentation
| --- | ---
| address | Data Advice user guide
| assessmentAreaKey | Data Advice user guide
| commercialInventory | Commercial Inventory Extract user guide
| folio | Data Advice user guide
| folioDescription | Data Advice user guide
| jurisdictionKey | Data Advice user guide
| legalDescription | Data Advice user guide
| metadata | _not a data table; info about the database_
| residentialInventory | Residential Inventory Extract user guide
| sales | Data Advice user guide
| valuation | Data Advice user guide
| value | Data Advice user guide 

!!! Important
    All fields in the BC Assessment SQLite database are in the "text" data type by default. 

### Joining tables 
Most users will need to join tables to access the data that interests them. The 10 tables derived from the _Data Advice_ product can be joined on the `folio_id` field. The two tables derived from _Inventory Extract_ products (_residentialInventory_ and _commercialInventory_) do not have folio IDs but can be joined to the _folio_ table using `roll_number` and `jurisdiction`.

!!! Important
    Roll numbers are unique within a jurisdiction but may be repeated across jurisdictions. When joining on `roll_number` also join on `jurisdiction` to avoid unintended results.

### Sales data
The _sales_ table contains data about the three most recent sales for each property in the database, regardless of when they occurred. The SQLite database for a given year includes most sales for that year but it does not necessarily provide a complete picture for previous periods. 
 
### Assessed property values
The _valuation_ table contains assessed values for each folio, reported as `landValue` and `improvementValue`. The _value_ table contains similar information but with additional values for BC  Transit and School purposes (see the `valueType` field). For most questions about assessed value use the _valuation_ table.

Some elements in the source XML are repeatable, including valuation. This means that one folio can have more than one entry in the _valuation_ table (each with a different `taxExemptCOde` or `propertyClassCode`, for example). Consult the documentation and ensure your analysis accounts for multiple entries.

### SQL queries
With the SQLite browser it's easy to filter tables and export to CSV, but SQL queries are the most efficient way to extract a subset of the data that fits your parameters. If you are new to SQL the [W3Schools SQL Tutorial](https://www.w3schools.com/sql/) is a good place to learn the basics. 

