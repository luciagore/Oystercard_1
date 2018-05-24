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

	context "#touch_in" do
		let(:station){ double :station }
		it "allows card to touch in at a barrier" do
			card.top_up(3)
			card.touch_in(station)
			expect(card.in_journey?).to eq true
		end
		it "prevents user touching in if without miniumum fare" do
			expect { card.touch_in(station) }.to raise_error "Insufficient funds"
		end
		it "stores the entry station for a journey" do
			card.top_up(3)
			card.touch_in("Aldgate")
			expect(card.entry_station).to eq "Aldgate"
		end

	end

	context "#touch_out" do
		let(:station){ double :station }
		it "allows card to touch out at a barrier" do
			card.touch_out
			expect(card.in_journey?).to eq false
		end

		it "deducts minimum fare from card on touch out" do
			card.top_up(3)
			card.touch_in(station)
			expect { card.touch_out }.to change { card.balance }.by (-Oystercard::MIN_FARE)
		end

		it "changes entry station to nil on touch out" do
			card.top_up(3)
			card.touch_in(station)
			card.touch_out
			expect(card.entry_station).to eq nil
		end
	end

	context "#in_journey?" do
		let(:station){ double :station }
		it "tells you if the card is touched in and user is on a journey" do
			card.top_up(3)
			card.touch_in(station)
			expect(card.in_journey?).to eq true
		end
	end
end
