require 'csv'

module Noaa
  Stations = CSV.read('lib/assets/stations.csv', headers: true)
end
