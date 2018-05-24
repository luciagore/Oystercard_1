require './lib/oystercard.rb'

# * User Story 1 *
# In order to use public transport
# As a customer
# I want money on my card

# * Feature Test 1 *
p oystercard = Oystercard.new
# p oystercard.balance

# * User Story 2 *
# In order to keep using public transport
# As a customer
# I want to add money to my card

# * Feature Test 2 *
# p oystercard.top_up(10)

# * User Story 3 *
# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card

# * Feature Test 3 *
# p oystercard.top_up(100)

# * User Story 4 *
# In order to pay for my journey
# As a customer
# I need my fare deducted from my card

# * Feature Test 4 *
# p oystercard.deduct(4)

# * User Story 5 *
# In order to get through the barriers.
# As a customer
# I need to touch in and out.

# * Feature Test 5 *
# p oystercard.touch_in
# p oystercard.touch_out
# p oystercard.in_journey?


# * User Story 6 *
# In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey.

# * Feature Test 6 *
p oystercard.touch_in
