#!/usr/bin/env python

import csv

# Read the CSV file
with open('/media/sf_c_home/Documents/Working/App_Infra_Data_at_Server_Level_crosstab.csv',
          encoding='iso-8859-1') as csvfile:
    readCSV = csv.reader(csvfile, delimiter=',')

    # Assign the values to the variables
    for row in readCSV:
        minion = (row[0])
        env = (row[1])
        group1 = (row[2])
        group2 = (row[3])
        group3 = (row[4])
        uaid = (row[5])
        sec_zone = (row[6])
        application = (row[7])
        business_solution = (row[8])
        business_segment = (row[9])
        first_level_support_group = (row[10])
        second_level_support_group = (row[11])
        third_level_support_group = (row[12])

        # Get use the
        myData = [[(minion), (uaid)]]
        myFile = open('~//temp/server_info-test.csv', 'a')
        with myFile:
            writer = csv.writer(myFile)
            writer.writerows(myData)

    print("Writing complete")

