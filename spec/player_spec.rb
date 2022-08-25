require 'pry'
require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do 
  before (:each) do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3) 
    @card3 = Card.new(:heart, 'Ace', 14)
    @deck = Deck.new([@ard1, @card2, @card3])
  end
end 