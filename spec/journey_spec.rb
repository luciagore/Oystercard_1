require 'journey'

describe Journey do
  subject(:journey) { described_class.new("Westminster", "Aldgate") }

  context '#initialize' do
    it 'returns the start point' do
      expect(journey.entry_station).to eq "Westminster"
    end

    it 'returns the end station' do
      expect(journey.exit_station).to eq "Aldgate"
    end
  end

  context '#complete?' do
    it 'returns true when in_journey is false' do
      journey.finish
      expect(journey.complete).to eq true 
    end
  end




  # it "allows journeys on the card to store entry station" do
  #   card.top_up(3)
  #   card.touch_in(station)
  #   expect(card.current_journey).to include(:entry_station => station)
  # end
end
