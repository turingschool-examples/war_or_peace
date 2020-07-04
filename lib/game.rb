require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'

class Game
attr_reader :player1, :player2, :turn, :starter, :deck1, :deck2

  def initialize(turn_param)
    @turn = turn_param
  end

  # def deck_setup
  #  @cards = []
  #  @suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
  #
  #   card_array = [
  #     [ "Two",     2],
  #     [ "Three",   3],
  #     [ "Four",    4],
  #     [ "Five",    5],
  #     [ "Six",     6],
  #     [ "Seven",   7],
  #     [ "Eight",   8],
  #     [ "Nine",    9],
  #     [ "Ten",     10],
  #     [ "Jack",    11],
  #     [ "Queen",   12],
  #     [ "King",    13],
  #     [ "Ace",     14]
  #   ]
  #
  #   @suits.each do |suit|
  #     card_array.each do |index|
  #       card = Card.new(suit, card_array[index][0], card_array[index][1])
  #     @cards << card
  #     end
  #   end
  #   @cards
  # end

  #
  



end
