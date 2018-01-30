
require 'irb'

class Oystercard
  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journey_history

  def initialize
    @balance = 0.0
    @journey_history = []
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
    @in_journey = true
  end

  def pre_touch_in_checks
    raise "Can't touch in, your balance is below #{MIN_FARE}" if @balance < MIN_FARE
  end

  def touch_out(station)
    deduct_fare(MIN_FARE)
    @exit_station = station
    @in_journey = false
    @journey_history << [@entry_station, @exit_station]
  end

  def in_journey?
    @in_journey
  end

  def print_journey_history
    count = 1
    @journey_history.each do |array|
      puts "Journey #{count} - Entry: " + array[0].to_s + " Exit: " + array[1].to_s
      count += 1
    end
  end

  private

  def deduct_fare(amount)
    @balance -= amount
  end
end
