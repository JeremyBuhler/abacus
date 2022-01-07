# Dataset code 

While Abacus contains the licensed data sets for you to work with, that is, the material provided by the publisher, what it *doesn't* contain is code written by the library and other researchers to work with this data.

The _Dataset code_ section provides scripts, tools, and guidance for working with specific datasets in Abacus. You'll also find software tools designed to work with the Abacus platform itself, and generalized data tools not specific to one particular data set.

Material in this section was created by UBC Library or contributed by the research community. If you've written code, queries, or other material that may help other researchers use an Abacus dataset please consider sharing it (contact Jeremy Buhler, Data Librarian, UBC Library at [jeremy.buhler@ubc.ca](mailto:jeremy.buhler@ubc.ca)).

## Abacus Git repository
Computer code, unlike books or even licensed data sets, is notoriously changeable. Browser versions can change frequently; the same can be said for utilities used to analyse data. Because of this, software is often stored on systems which allow *version control*. More than just indicating the most current version of a piece of software, version control systems allow users to track changes in the software, allowing you to move not only forward and back over versions, but laterally over branched changes.

Utilities and code snippets for material in Abacus are stored in such a system, specfically using a version control system called [Git](https://en.wikipedia.org/wiki/Git). This is more suitable than storing them within Abacus itself, as the Git system is much more user-friendly for copying, modifying and reusing software than the built-in version control system in Abacus.

[Take me to the Abacus git utility repository](https://github.com/abacus-code)

### How to use Git

There are two possible ways to use Git: from the command line, or using a graphical user interface.

* There is a (very) basic tutorial available for the command line interface at the [https://git-scm.com/docs/gittutorial] (Git website). There is also no shortage of tutorials vaialble simpy by searching for "Git tutorial".

* Graphical user interfaces will vary by designer and users will undoubtedly have opinions on which is better or worse. Searching for "Best Git GUI" will produce pages of users arguing on internet forums. Git has an "official" client, [Github Desktop](https://desktop.github.com/).

If you are completely new to the concept and prefer something hands on and less technically dry, there is a free game which teaches the basics of Git: [Oh My Git](https://ohmygit.org/).

## General purpose utilities

These tools or utilities are not specific to a single dataset &#8212 or even to the Abacus platform &#8212 but they may be useful when working with datasets from Abacus. 

### fcheck/damage
* <https://github.com/ubc-library-rc/fcheck>

Damage is a simple command-line utility which outputs a file manifest in a variety of formats, with a special focus on statistical package files from SPSS, SAS and Stata. FCheck is the Python 3 module which powers the damage utility, which you can use in your own python code.

### dataverse_utils  
* <https://github.com/ubc-library-rc/dataverse_utils>

Abacus runs on the open source [Dataverse](https://dataverse.harvard.edu) platform. This is a Python library and generalized set of utilities which help with managing Dataverse repositories.

## Dataset-specific resources

Use the menu or the links below to access resources and code related to specific datasets or types of data in Abacus

- [BC Assessment data](bc_assessment/bc_assessment.md)
- [Postal Code Conversion Files (PCCF)](pccf/pccf.md)
