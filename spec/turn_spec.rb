require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/turn'
require 'pry'

RSpec.describe Turn do

  before :each do
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, 'King', 13)
    @card3 = Card.new(:heart, '3', 3)

    @cards = [@card1,@card2,@card3]

    @deck = Deck.new @cards

    @player = Player.new @deck
  end




end
