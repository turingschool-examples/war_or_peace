require 'rspec'
require '../lib/card'

RSpec.describe Card do

  it 'exists' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    expect(diamondQ).to be_an_instance_of(Card)
  end

  it 'has readable attributes' do
    diamondQ = Card.new(:diamond, 'Queen', 12)
    heart2 = Card.new(:heart, '2', 2)

    expect(diamondQ.suit).to eq(:diamond)
    expect(diamondQ.value).to eq('Queen')
    expect(diamondQ.rank).to eq(12)

    expect(heart2.suit).to eq(:heart)
    expect(heart2.value).to eq('2')
    expect(heart2.rank).to eq(2)
  end
end
