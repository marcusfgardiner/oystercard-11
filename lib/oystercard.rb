
class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    pre_top_up_checks(amount)
    @balance += amount
  end

  def pre_top_up_checks(amount)
    error_message = "Can't top up, max balance of #{MAX_BALANCE} reached"
    raise error_message if (@balance + amount) > MAX_BALANCE
  end
end
