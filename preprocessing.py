# -*- coding: utf-8 -*-
"""
Created on Thu Jan 11 12:03:24 2018

@author: Quirine
"""
# Importing packages
import json
import csv

# Opening json file
with open('conflict_data_full_lined.json') as my_file:
    data = json.load(my_file)

#So that I could make a selection I had data[0:50]
conflict_limited = data

# Selecting some couontries and only the columns that I want
conflict = []
country_selection = ['Peru','Colombia', 'Brazil', 'Bolivia', 'Ecuador', 'Argentina']
for dictionary in conflict_limited:
    if dictionary['country'] in country_selection:    
        conflict.append([dictionary['country'],dictionary['year'],dictionary['deaths_a'],dictionary['deaths_b']])

# make as csv
with open('preprocessed_data_extended.csv', 'w', newline='') as file:
    csvwriter= csv.writer(file, delimiter=',', quotechar='"', quoting=csv.QUOTE_NONNUMERIC)
    csvwriter.writerow(['Country', 'Year', 'Deaths_a', 'Deaths_b'])
    csvwriter.writerows(conflict)
    #list of lists with elements country, year, deaths_a, deaths_b
