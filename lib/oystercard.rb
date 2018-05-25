class Oystercard

  START_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :journeys, :current_journey, :in_journey

  def initialize(balance = START_BALANCE)
    @balance = balance
    @journeys = []
    @current_journey = {}
    @in_journey = false
  end

  def top_up(amount)
    message = "Maximum balance of #{MAX_BALANCE} exceeded"
    raise message if @balance + amount > MAX_BALANCE
  	@balance += amount
  end

  def touch_in(entry_station = nil)
    fail "Insufficient funds" if @balance < MIN_FARE
    @current_journey[:entry_station] = entry_station
    @in_journey = true
  end

  def touch_out(exit_station = nil)
    deduct(MIN_FARE)
    @current_journey[:exit_station] = exit_station
    @journeys.push(@current_journey)
    @current_journey = {}
    @in_journey = false
  end

  private
  def deduct(fare)
  	@balance -= fare
  end

end
