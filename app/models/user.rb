class User < ActiveRecord::Base

  before_validation -> { self.phone = phone.gsub(/\D/,"") }

  validates :phone, format: {
    with: /\A\d{10}\Z/,
    message: "Must be exactly 10 digits"
  }

  validates_presence_of :station_id

  def todays_tides_text_body
    station.sms_tides_for_date
  end

  private

  def station
    Noaa::Station.find(station_id)
  end

end
