'''
Reads in PCCF data from the PCCF text file and
extracts some of the data and saves it as a tsv.
'''

import csv

#pick and choose what you want. These are the indexes you want to read, and the last number
#is *non-inclusive*, which is very handy because then you can just put in the start index of
# the next variable. Use them as shown in the codebook because math is done later.
# If you want more (or fewer variables), just edit this dictionary.

what_i_want = {'PC': (1,6), #ie, positions
               'CDUID': (12,16), #The keys can be called whatever you want;
               'DGUID': (126,134),#The names are arbitrary
               'LAT': (138,148),
               'LONG': (149, 162),
               'SLI': (162,163)}

#Change this to whatever PCCF file you are using, including the path if required.
#It comes encoded as Windows-1252, which is important if you are using something
#other than Windows
with open('PCCF_FCCP_V2409_2021.txt', mode='r', encoding='windows-1252') as pccf_file:
    pccf = pccf_file.readlines() # separates the file into lines

#The output encoding is UTF-8, which is multi-platform
#The output file will be a tab-delimited file, but if you want you can change the
#delimiter to whatever you want with the 'delimiter' parameter.
#If you change it commas, you probably should change the extension to '.csv'

with open('pccf_subsample.tsv', mode='w', newline='', encoding='utf-8') as out:
    writer = csv.DictWriter(out, fieldnames=what_i_want.keys(),
                            quoting=csv.QUOTE_MINIMAL, delimiter='\t')
    writer.writeheader()
    for row in pccf:
        writeme = {}
        for key, value in what_i_want.items():
            #Python indexing starts at zero, not one, hence the '-1'
            writeme.update({key : row[value[0]-1:value[1]-1]})
        writer.writerow(writeme)
#Now you have a .tsv file. However, it will still have 1.3 million
#lines, so Excel will still complain. But at least it's readable.
