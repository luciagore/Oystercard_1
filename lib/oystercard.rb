class Oystercard

  START_BALANCE = 0
  MAX_BALANCE = 90
  attr_reader :balance

  def initialize(balance = START_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    message = "Maximum balance of #{MAX_BALANCE} exceeded"
    raise message if @balance + amount > MAX_BALANCE
  	@balance += amount
  end

  def deduct(fare)
  	@balance -= fare
  end

end
