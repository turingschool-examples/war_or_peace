require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :player1, :player2, :cards, :turn_count, :winner

  def initialize
    cards = make_cards
    deck_1 = Deck.new(cards.pop(26))
    deck_2 = Deck.new(cards)
    @player1 = Player.new("Megan", deck_1)
    @player2 = Player.new("Aurora", deck_2)
    @turn_count = 0
    @winner = nil
  end

  def make_cards
    suits = [:spade, :club, :heart, :diamond]
    cards_array = []
    suits.each do |suit|
      values = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
      value_rank_pairs = values.zip((1..14).to_a)
      value_rank_pairs.each do |vr|
        card = Card.new(suit, vr[0], vr[1])
        cards_array << card
      end
    end
    cards_array.shuffle
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards. \n
    The players today are #{player1} and #{player2}. \n
    Type 'GO' to start the game!"\n
    input = gets.chomp.downcase
    if input == 'go'
      while player_win? == false
        take_a_turn
      end
    elsif
      p "unrecognized input '#{input}'/n  Please enter 'GO' to play"
      start
    end
  end




      def messages
      {
      welcome:
      "Welcome to War! (or Peace) This game will be played with 52 cards.\n
      The players today are #{p1.name} and #{p2.name}.\n
      Type 'GO' to start the game!
      ------------------------------------------------------------------",
      basic: "#{winner.name if winner} won 2 cards",
      war: "WAR - #{winner.name if winner} won 6 cards",
      mad: "*mutually assured destruction* 6 cards removed from play",
      game_over: "*~*~*~* #{winner.name if winner} has won the game! *~*~*~*"
      }
    end









end
