#!/usr/bin/env bash

sqlite-utils insert --csv --detect-types --pk=calendar-years --pk=week-number --pk=administrative-geography --pk=recorded-deaths ons.db weekly-deaths-region weekly-deaths-historical.csv
sqlite-utils insert --csv --detect-types --alter ons.db weekly-deaths-region weekly-deaths-region.csv
sqlite-utils convert ons.db weekly-deaths-region week-number 'value.split("-")[1]'
sqlite-utils transform ons.db weekly-deaths-region \
  --type week-number integer \
  --rename V4_1 count
