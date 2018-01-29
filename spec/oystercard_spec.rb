require 'oystercard'

describe Oystercard do
  let(:amount) { 10 }

  context '#initialize' do
    it 'has a default balance of 0' do
      expect(subject.balance).to eq 0
    end
  end
  context '#top_up' do
    it 'tops up card with input balance' do
      expect { subject.top_up(amount) }.to change { subject.balance }.by amount
    end

    it 'raises an error if top up exceeds max balance' do
      expect { subject.top_up(described_class::MAX_BALANCE + amount) }.to raise_error "Can't top up, max balance reached"
    end
  end
end
