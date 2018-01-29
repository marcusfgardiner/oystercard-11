require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:amount) { 10 }

  context '#initialize' do 
    it 'has a default balance of 0' do 
      expect(oystercard.balance).to eq 0
    end
  end
  context '#top_up' do 
    it 'tops up card with input balance' do 
      oystercard.top_up(amount)
      expect(oystercard.balance).to eq amount  
    end
  end
end
