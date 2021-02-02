require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest :: Test
  def initialize
    @cards = []
    # This is a new array with nothing in it "
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    #These three cards are taken from the iteration 1 procedure.

    @cards.push(@card1, @card2, @card3)
    #This line combines our three new cards in an array
    @deck = Deck.new(@cards)
    #This line calls the empty array of instance variable @cards
