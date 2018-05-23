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

end
