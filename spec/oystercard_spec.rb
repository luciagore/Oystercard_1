require './lib/oystercard.rb'

describe Oystercard do

	subject(:card) { described_class.new }

	it "initalizes and checks that balance is zero" do
  	expect(card.balance).to eq Oystercard::START_BALANCE
	end

end
