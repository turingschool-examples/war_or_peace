require 'rspec'
require './lib/deck'
require './lib/card'
require 'pry'

RSpec.describe Deck do
  it 'exists' do
    card = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)
    expect(card).to be_an_instance_of(Card)
  end
  
end

# card = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3) 
# card3 = Card.new(:heart, 'Ace', 14)
