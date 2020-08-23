require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/standarddeck'

class TurnTest < Minitest::Test
  def test_it_exists_and_has_attributes
    standard_deck = StandardDeck.new


    assert_instance_of StandardDeck, standard_deck
    assert_equal standard_deck, standard_deck.initialize


  end


end
