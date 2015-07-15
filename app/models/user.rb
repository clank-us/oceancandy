class User < ActiveRecord::Base

  def todays_tides_text_body
    station.sms_tides_for_date
  end

  private

  def station
    Noaa::Station.find(station_ids.first)
  end

end
