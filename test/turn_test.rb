require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/player'
require './lib/card'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test

def test_it_exists
  #:play1 :play2 :spoils_of_war
end

def test_type
  #basic, #war, #mutually_assured_destruction
end

def test_winner
  #return the winner of the turn
end

def test_pile_cards
  #cards are sent from player's decks into spoils of war.
end

def test_award_spoils
  #add cards in @spoils_of_war to the winner of each turn  
end
def
