require './lib/oystercard.rb'

describe Oystercard do
	subject(:card) { described_class.new }

	context "#balance"

		it "initalizes and checks that balance is zero" do
	  		expect(card.balance).to eq Oystercard::START_BALANCE
		end

	context "#top_up"
		it "allows user to add funds to the balance" do
			expect { card.top_up(10) }.to change { card.balance }.by 10
		end

		it "protects a card balance from exeeding £90" do
			message = "Maximum balance of #{Oystercard::MAX_BALANCE} exceeded"
			expect { card.top_up(Oystercard::MAX_BALANCE.next) }.to raise_error message
		end

	context "#deduct"
		it "deducts the fare from balance" do
			card.top_up(4)
			expect { card.deduct(4) }.to change { card.balance }.by -4
		end

	context "#touch_in"
		it "allows card to touch in at a barrier" do
			expect(card.touch_in).to eq true
		end

	context "#touch_out"
		it "allows card to touch out at a barrier" do
			expect(card.touch_out).to eq true
		end

	context "#in_journey?"
		it "tells you if the card is touched in an on route" do
			card.touch_in
			expect(card.in_journey?).to eq true
		end
end
