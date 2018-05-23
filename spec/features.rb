require './lib/oystercard.rb'

# * User Story 1 *
# In order to use public transport
# As a customer
# I want money on my card

# * Feature Test 1 *
p oystercard = Oystercard.new
p oystercard.balance


# In order to keep using public transport
# As a customer
# I want to add money to my card
p oystercard.top_up(10)