require 'irb'

class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0.0
    @in_journey = false
  end

  def top_up(amount)
    pre_top_up_checks(amount)
    @balance += amount
  end

  def pre_top_up_checks(amount)
    error_message = "Can't top up, max balance of #{MAX_BALANCE} reached"
    raise error_message if (@balance + amount) > MAX_BALANCE
  end

  def touch_in
    pre_touch_in_checks
    @in_journey = in_journey?
  end

  def pre_touch_in_checks
    raise "Can't touch in, your balance is below #{MIN_FARE}" if @balance < MIN_FARE
  end

  def touch_out
    deduct_fare(MIN_FARE)
    @in_journey = !in_journey?
  end

  def in_journey?
    true
  end

  private
  def deduct_fare(amount)
    @balance -= amount
  end
end
