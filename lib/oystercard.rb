require_relative 'journey'
class Oystercard

  START_BALANCE = 0
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_accessor :balance, :journeys, :current_journey

  def initialize(balance = START_BALANCE)
    @balance = balance
    @journeys = []
    @current_journey = Journey.new
  end

  def top_up(amount)
    message = "Maximum balance of #{MAX_BALANCE} exceeded"
    raise message if @balance + amount > MAX_BALANCE
  	@balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if @balance < MIN_FARE
    @current_journey.entry_station = entry_station
  end

  def touch_out(exit_station = nil)
    deduct(MIN_FARE)
    @current_journey.finish
    @current_journey.exit_station = exit_station
    @journeys.push(@current_journey)
    @current_journey = Journey.new
  end

  private
  def deduct(fare)
  	@balance -= fare
  end

end
