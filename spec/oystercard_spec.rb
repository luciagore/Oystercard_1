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
			message = "Maximum balance exceeded"
			expect { card.top_up(Oystercard::MAX_BALANCE.next) }.to raise_error message
		end

end
