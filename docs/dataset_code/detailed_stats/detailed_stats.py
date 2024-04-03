'''
Extract per-collection download stats out of a Dataverse installation.
This is quick and dirty and edit the parameters as required.

Obviously this can be extended to be much more user-friendly.

Think of this like a Github gist.

Requires requests:
    `pip install requests`

As of this writing this doesn't actually require an API key,
so that's nice.

Paul Lesack
2024-04-03
'''
# pylint: disable = line-too-long

import csv
import requests

BASEURL = 'https://test.invalid' #base URL
PARENTALIAS = 'collectionname' # Whatever the short collection alias is
OUTFILE = 'filenamehere.tsv' # outfile name

def main():
    '''
    Run this to get download stats
    '''
    counts = requests.get('{BASEURL}/api/info/metrics/filedownloads',
                          params = {'parentAlias' : PARENTALIAS},
                          headers={'accept':'application/json'}, timeout=100).json()
    ez_count = {x['id']:x['count'] for x in counts['data']}

    studies = requests.get(f'{BASEURL}/api/dataverses/{PARENTALIAS}/contents',
                           timeout=100).json()

    file_list = []
    for study in studies['data']:
        stud = requests.get(f'{BASEURL}/api/datasets/{study["id"]}', timeout=100).json()
        title = [x['value'] for x in stud['data']['latestVersion']['metadataBlocks']['citation']['fields']
                 if x['typeName']=='title'][0]
        files = stud['data']['latestVersion']['files']
        for file in files:
            if ez_count.get(file['dataFile']['id']):
                file_list.append({'id': file['dataFile']['id'],
                                 'doi': f"doi:{stud['data']['authority']}/{stud['data']['identifier']}",
                                 'filename': file.get('label',''),
                                 'description': file.get('description', '').strip().replace('\t',''),
                                 'content_type': file['dataFile']['contentType'],
                                 'study_title':title,
                                 'download_count': ez_count[file['dataFile']['id']]
                                  })

    with open(OUTFILE, mode='w', newline='', encoding='utf-8') as oot:
        writer=csv.DictWriter(oot, fieldnames=file_list[0].keys(), delimiter='\t',
                              quoting=csv.QUOTE_MINIMAL)
        writer.writeheader()
        for row in file_list:
            writer.writerow(row)

if __name__ == '__main__':
    main()
