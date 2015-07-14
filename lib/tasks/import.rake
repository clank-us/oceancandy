namespace :import do
  desc "import all the NOAA tide stations"
  task noaa_stations: :environment do
    raise StandardError.new("Only run imports in development") unless Rails.env.development?
    Noaa::StateImport.new.import
  end

  desc "import all tides for all stations" do
    task noaa_tides: :environment do
    raise StandardError.new("Only run imports in development") unless Rails.env.development?
      year = ENV.fetch("YEAR", Time.now.year)
      Noaa::TideImport.new.import(year)
    end
  end
end
