require "oystercard"

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  context '#initialize' do 

    it 'has a default balance of 0' do 

      expect(oystercard.balance).to eq 0
    end
  end
end
