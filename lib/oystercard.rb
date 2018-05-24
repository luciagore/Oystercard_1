class Oystercard

  START_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station

  def initialize(balance = START_BALANCE)
    @balance = balance
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    message = "Maximum balance of #{MAX_BALANCE} exceeded"
    raise message if @balance + amount > MAX_BALANCE
  	@balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if @balance < MIN_FARE
    @entry_station = entry_station
    @journeys << @entry_station
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private
  def deduct(fare)
  	@balance -= fare
  end

end
