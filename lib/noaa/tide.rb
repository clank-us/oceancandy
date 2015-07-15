require 'ostruct'

module Noaa
  class Tide < OpenStruct

    attr_accessor :time_zone

    def time_zone
      @time_zone ||= "Eastern Time (US & Canada)"
    end

    def to_hash
      {
        time: time.to_s,
        feet: feet,
        tide: tide
      }
    end

    def is_on_date?(date)
      date.year  == time.year &&
        date.month == time.month &&
        date.day   == time.day
    end

    def time
      @time ||= Time.parse(super).in_time_zone(time_zone)
    end

    def hour
      time.to_s(:hour)
    end

    def tide
      {
        "H" => "High",
        "L" => "Low"
      }[super]
    end

  end
end
