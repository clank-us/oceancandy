# Ocean Candy

Receive a text of the tides in a specific location every day.

## API

```
/stations
```
Return a json object of all the stations.

```

/stations/:station_id
```
Return todays tides for the given station

## Installation

```
git clone git@github.com:clank-us/oceancandy.git

bundle --jobs 4

rake db:setup

rake
```

## Importing Data

__NOTE__: this should only be done in development. Then just commit the new csv files and re deploy.

To import tides for a year:

```
rake import:tides YEAR=<year>
```
