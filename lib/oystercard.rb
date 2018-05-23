class Oystercard

  START_BALANCE = 10
  attr_reader :balance

  def initialize(balance = START_BALANCE)
    @balance = balance
  end

  def top_up(amount)
  	@balance += amount
  end

end
