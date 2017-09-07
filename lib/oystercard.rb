require_relative 'journey'

class Oystercard
  attr_reader :balance, :journey
  CARD_LIMIT = 90
  MINIMUM = 1
  PENALTY = 6
  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
  end

  def top_up(amount)
    raise 'Oystercard maximum balance of £90 exceeded' if balance + amount > CARD_LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient funds to travel' if @balance < MINIMUM
    if @journey.in_journey?
      deduct(PENALTY)
      @journey.touch_out('incomplete journey')
    end
    @journey.touch_in(station)
  end

  def touch_out(station)
    if @journey.in_journey?
      deduct(MINIMUM)
    else
      deduct(PENALTY)
      @journey.touch_in('No touch in')
    end
    @journey.touch_out(station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

# def touch in(station)
# @entry_station = station
