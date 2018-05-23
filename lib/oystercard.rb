class Oystercard

  START_BALANCE = 10
  MAX_BALANCE = 90
  attr_reader :balance

  def initialize(balance = START_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    raise "Maximum balance exceeded" if @balance + amount > MAX_BALANCE
  	@balance += amount
  end

end
