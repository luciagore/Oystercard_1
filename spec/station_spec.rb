require 'station'

describe Station do

  context '#initialize' do
    it 'returns the station name' do
      station = Station.new("Hammersmith", 1)
      expect(station.name).to eq "Hammersmith"
    end

    it 'returns the station zone' do
      station = Station.new("Hammersmith", 1)
      expect(station.zone).to eq 1
    end

  end
end
