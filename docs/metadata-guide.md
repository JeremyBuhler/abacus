# Metadata guide
This guide outlines the metadata expectations and standards for describing datasets in the [Abacus data repository](https://abacus.library.ubc.ca).

Abacus is hosted on the Dataverse platform and datasets are described using the Data Documentation Initiative [DDI Codebook 2.5](https://ddialliance.org/Specification/DDI-Codebook/2.5/) metadata standard. Definitions in this guide are copied from DDI 2.5 with additional notes and explanations that apply to the Abacus context.

## Required metadata fields
The table below includes all the metadata fields required by the Dataverse platform. In practice most Abacus datasets have additional metadata to improve description and discovery, but only these fields are enforced by the Abacus interface.

| Dataverse field label | DDI-C 2.5 element
| --- | ---
| Title | `<titl>`
| Author name | `<AuthEnty`
| Contact e-mail | `<contact>`
| Description text | `<abstract>`
| Subject | `<subect>`
| Place
| Contact email/contact name
| Unique file name (for files in a dataset)

### Recommendations for non-required fields
If there are sections that should be deleted, or recommendations. Also a place to note that you need to save the 'basic block' first before you can access the other metadata fields.


## Added fields, after creating the dataset
These should be added when available to improve findability and consistency across Abacus datasets.

Dataverse field label | DDI-C 2.5 element
| --- | ---
| Production Date | `<prodDate>`
| Geographic Coverage, Country/recommendations | `<nation>`
| Geographic Unit | `<geogUnit>`
| Keyword | `<keyword>`
