class Oystercard

  START_BALANCE = 0
  attr_reader :balance

  def initialize(balance = START_BALANCE)
    @balance = balance
  end

end
