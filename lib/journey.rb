class Journey
  attr_reader :journey, :journey_log , :entry_station

  def initialize
    @entry_station = nil
    @journey_log = []
  end

  def touch_in(station)
    @entry_station = { entry_station: station }
    @journey = @entry_station
  end

  def touch_out(station)
    @exit_station = { exit_station: station }
    @journey.merge!(@exit_station)
    @entry_station = nil
    @journey_log << @journey
  end

  def in_journey?
    !!@entry_station
  end
end
