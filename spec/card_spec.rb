require 'rspec'
require 'pry'
require './lib/card'

RSpec.describe Card do
  before do
    @card = Card.new(:foo, 'Bar', 9001)
  end

  it 'exists' do
    expect(@card).to be_an_instance_of(Card)
  end

  it 'has readable attributes' do
    expect(@card.suit).to eq(:foo)
    expect(@card.value).to eq('Bar')
    expect(@card.rank).to eq(9001)
  end

end
