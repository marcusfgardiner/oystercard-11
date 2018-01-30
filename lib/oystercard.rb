
class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
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

  def deduct_fare(amount)
    @balance -= amount
  end

  def touch_in
    # change_journey_status
    @in_journey = in_journey?
  end

  def touch_out
     @in_journey = !in_journey?
  end

  def in_journey?
    true
  end
end
