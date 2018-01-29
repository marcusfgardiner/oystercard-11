require 'oystercard'

describe Oystercard do
  let(:amount) { 10 }
  let(:oyster_with_balance) do
    subject.top_up(50)
    subject
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

  context '#deduct_fare' do
    it 'deducts a fare from the balance' do
      expect { oyster_with_balance.deduct_fare(amount) }.to change { oyster_with_balance.balance }.by (-amount)
    end
  end

  # TODO - make test so this can be true or false
  # context '#in_journey?' do
  #   it "changes the card's @journey to true" do
  #     expect( oyster_with_balance.)
  #   end
  # end
end
