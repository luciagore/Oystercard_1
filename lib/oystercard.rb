class Oystercard

  START_BALANCE = 0
  MAX_BALANCE = 90
  attr_reader :balance, :touch_in, :touch_out

  def initialize(balance = START_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    message = "Maximum balance of #{MAX_BALANCE} exceeded"
    raise message if @balance + amount > MAX_BALANCE
  	@balance += amount
  end

  def deduct(fare)
  	@balance -= fare
  end

  def touch_in
    @touch_in = true
    @in_journey = true
  end

  def touch_out
    @touch_out = true
  end

  def in_journey?
    @in_journey == true
  end

end
