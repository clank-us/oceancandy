class PagesController < ApplicationController

  expose(:user)

  before_action :set_headers

  def stations
    render json: Oj.dump( Noaa::Station.all.group_by(&:state_name), mode: :compat)
  end

  def station
    station = Noaa::Station.find(params[:station_id])
    tides = station.tides_for_date(params[:date])

    render json: Oj.dump(tides.group_by{|t| t.tide}, mode: :compat)
  end

  private

  def set_headers
    headers["Access-Control-Allow-Origin" ] = "*"
    headers["Access-Control-Request-Method"] = "GET"
  end

end
