require 'csv'

module Noaa
  Stations = CSV.read('assets/stations.csv', headers: true)
end
