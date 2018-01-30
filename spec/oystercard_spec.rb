# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  let(:station) {double("A station")}
  let(:amount) { 10 }
  let(:oyster_with_balance) do
    subject.top_up(50)
    subject
  end
  let(:oyster_touched_in) do
    oyster_with_balance.touch_in(station)
    oyster_with_balance
  end
  let(:oyster_touched_out) do
    oyster_touched_in.touch_out
    oyster_touched_in
  end

  context '#initialize' do
    it 'has a default balance of 0' do
      expect(subject.balance).to eq 0
    end

    it 'default journey status is false' do
      expect(subject).not_to be_in_journey
    end
  end

  context '#top_up' do
    it 'tops up card with input balance' do
      expect { subject.top_up(amount) }.to change { subject.balance }.by amount
    end

    it 'raises an error if top up exceeds max balance' do
      error_message = "Can't top up, max balance of #{described_class::MAX_BALANCE} reached"
      expect { subject.top_up(described_class::MAX_BALANCE + amount) }.to raise_error error_message
    end
  end

  context '#touch_in' do
    it "shouldn't allow touch in if balance is below minimum" do
      error_message = "Can't touch in, your balance is below #{described_class::MIN_FARE}"
      expect { subject.touch_in(station) }.to raise_error error_message
    end

    it 'should make in_journey? true' do
      expect(oyster_touched_in).to be_in_journey
    end

    it "Should keep track of starting station" do
      expect(oyster_touched_in.entry_station).to eq station
    end
  end

  context '#touch_out' do
    it 'should make in_journey? false' do
      expect(oyster_touched_out).not_to be_in_journey
    end

    it 'should deduct min fare on touch out' do
      expect { oyster_touched_in.touch_out }.to change { oyster_touched_in.balance }.by -described_class::MIN_FARE
    end
  end
end
