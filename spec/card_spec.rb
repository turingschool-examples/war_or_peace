require 'spec_helper'

RSpec.describe Card do
  let(:card) { Card.new(:diamond, 'Queen', 12) }

  it 'exists' do
    expect(card).to be_an_instance_of(Card)
  end

  it 'has readable attributes' do
    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
   
  end
end
