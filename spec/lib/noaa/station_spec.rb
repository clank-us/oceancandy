require 'rails_helper'

describe Noaa::Station do

  subject { described_class }

  describe '.find' do
    it "returns the station by station id" do
      expect(subject.find(8410834).name).to eq("PETTEGROVE POINT, DOCHET ISLAND")
    end
  end

  describe ".all" do
    it "returns all the stations" do
      expect(subject.all.count).to eq(3021)
      expect(subject.all.first).to be_a(Noaa::Station)
    end
  end

  describe "#tides" do
    it "shows all tides" do
      expect(described_class.all.first.tides).to be_a(Array)
    end
    it "is a collection of Tides" do
      expect(subject.all.first.tides.first).to be_a(Noaa::Tide)
    end
  end

  describe "#tides_for_date" do
    it "shows all tides for a passed in date" do
      tides = subject.all.first.tides_for_date(Date.parse("2014-06-06"))
      expect(tides.count).to eq(3)
    end

    it "shows all tides for today when now date is passed in" do
      tides = subject.all.first.tides_for_date(Date.parse('2015-07-15'))
      expect(tides.count).to eq(4)
    end
  end

  describe "grouped_tides_for_date" do
    it "groups tides by tide" do
      tides = subject.all.first.grouped_tides_for_date
      expect(tides).to be_a Hash
    end
  end

  describe "sms_tides_for_date" do
    it "formats for sms" do
      tides = subject.all.first.sms_tides_for_date(Date.parse('2015-07-15'))
      expect(tides).to eq("Wed, Jul 15 - 2015\nHigh-> 12:13 AM | 12:41 PM\nLow -> 06:46 AM | 07:03 PM\n")
    end
  end

end
