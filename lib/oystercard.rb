require 'irb'

class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance, :in_journey

  def initialize
    @balance = 0
<<<<<<< HEAD
    @in_journey = in_journey?
=======
    @in_journey = false
>>>>>>> 4a47e79b295ec0eb160a3a29309b4206ebd71a7a
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

<<<<<<< HEAD
  def in_journey?
    # TODO - make test so this can be true or false
    false
=======
  def touch_in
    # change_journey_status
    @in_journey = in_journey?
  end

  def touch_out
     @in_journey = !in_journey?
  end

  def in_journey?
    true
>>>>>>> 4a47e79b295ec0eb160a3a29309b4206ebd71a7a
  end
end
