require 'csv'
require 'ostruct'
require 'stations'
require 'tide'

module Noaa
  class Station < OpenStruct

    def self.find(station_id)
      raw_station = Stations.find {|row| row["station_id"] == station_id.to_s }
      new(raw_station.to_h)
    end

    def self.all
      Stations.map do |raw_station|
        new(raw_station.to_h)
      end
    end

    def to_hash
      {
        name: name,
        id: station_id,
        lattitude: lattitude,
        longitude: longitude
      }
    end

    def tides(year = Time.now.year)
      @tide_year = year
      raw_tides.map do |raw_tide|
        Tide.new(raw_tide.to_h)
      end
    end

    def sms_tides_for_date(date=nil)
      date ||= Date.today
      <<-SMS
#{date.to_s(:us) }
High-> #{grouped_tides_for_date["High"].map{ |tide| tide.hour }.join(" | ") }
Low -> #{grouped_tides_for_date["Low"].map{ |tide| tide.hour }.join(" | ") }
SMS

    end

    def tides_for_date(date=nil)
      if date.nil?
        query_date = Time.now
      else
        query_date = Time.parse(date)
      end
      tides(query_date.year).select do |tide|
        tide.is_on_date?(query_date)
      end
    end

    def grouped_tides_for_date(date=nil)
      tides_for_date(date).group_by do |tide|
        tide.tide
      end
    end

    private

    def raw_tides
      @tides_table ||= CSV.read(csv_file_name, headers: true)
    end

    def tide_year
      @tide_year
    end

    def csv_file_name
      "lib/assets/tides/station#{station_id}_year#{tide_year}.csv"
    end

  end
end
