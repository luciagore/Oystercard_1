class Oystercard

  START_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

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

  def touch_in
    fail "Insufficient funds" if @balance < MIN_FARE
    @touch_in = true
    @in_journey = true
  end

  def touch_out
    @balance -= MIN_FARE
    @touch_out = true
  end

  def in_journey?
    @in_journey == true
  end

  private
  def deduct(fare)
  	@balance -= fare
  end

end
