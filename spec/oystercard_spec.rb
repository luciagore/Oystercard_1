require './lib/oystercard.rb'

describe Oystercard do
	subject(:card) { described_class.new }

	context "#balance" do
		it "initalizes and checks that balance is zero" do
	  		expect(card.balance).to eq Oystercard::START_BALANCE
		end
	end

	context "#top_up" do
		it "allows user to add funds to the balance" do
			expect { card.top_up(10) }.to change { card.balance }.by 10
		end

		it "protects a card balance from exeeding £90" do
			message = "Maximum balance of #{Oystercard::MAX_BALANCE} exceeded"
			expect { card.top_up(Oystercard::MAX_BALANCE.next) }.to raise_error message
		end
	end

	context "#deduct" do
		it "deducts the fare from balance" do
			card.top_up(4)
			expect { card.deduct(4) }.to change { card.balance }.by -4
		end
	end

	context "#touch_in" do
		it "allows card to touch in at a barrier" do
			card.top_up(3)
			expect(card.touch_in).to eq true
		end
		it "prevents user touching in if without miniumum fare" do
			expect { card.touch_in }.to raise_error "Insufficient funds"
		end
	end

	context "#touch_out" do
		it "allows card to touch out at a barrier" do
			expect(card.touch_out).to eq true
		end
	end

	context "#in_journey?" do
		it "tells you if the card is touched in and user is on a journey" do
			card.top_up(3)
			card.touch_in
			expect(card.in_journey?).to eq true
		end
	end 
end
