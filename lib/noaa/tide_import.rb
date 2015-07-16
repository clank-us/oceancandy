require 'faraday'

module Noaa
  class TideImport

    def import(year = Time.now.year)
      stations.each do |station|
        station.import_tides(year)
      end
    end

    def stations
      @stations ||= TideStation.all
    end

  end
end
