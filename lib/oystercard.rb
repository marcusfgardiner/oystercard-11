
require 'irb'

class Oystercard
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station

  def initialize
    @balance = 0.0
  end

  def top_up(amount)
    pre_top_up_checks(amount)
    @balance += amount
  end

  def pre_top_up_checks(amount)
    error_message = "Can't top up, max balance of #{MAX_BALANCE} reached"
    raise error_message if (@balance + amount) > MAX_BALANCE
  end

  def touch_in(station)
    pre_touch_in_checks
    @entry_station = station
  end

  def pre_touch_in_checks
    raise "Can't touch in, your balance is below #{MIN_FARE}" if @balance < MIN_FARE
  end

  def touch_out
    deduct_fare(MIN_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct_fare(amount)
    @balance -= amount
  end
end
