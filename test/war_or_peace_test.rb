require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/war_or_peace'
class TurnTest < Minitest::Test
  def setup  
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @deck1 = Deck.new([@card3, @card2, @card1])
    @deck2 = Deck.new([@card6, @card5, @card4])
    @player1 = Player.new("Alex",@deck1)
    @player2 = Player.new("Another Alex",@deck2)
    @turn = Turn.new(@player1, @player2)
    @war = War.new
  end
  def test_it_exists
    assert_instance_of War, @war
  end   
  

end