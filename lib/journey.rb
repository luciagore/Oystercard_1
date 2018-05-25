class Journey

  attr_accessor :entry_station, :exit_station, :complete

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    @complete = false
  end

  def finish
    @complete = true
  end

  def complete
    @complete
  end

end
