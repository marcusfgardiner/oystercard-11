
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
    raise "Can't top up, max balance reached" if (@balance + amount) > MAX_BALANCE
  end
end
