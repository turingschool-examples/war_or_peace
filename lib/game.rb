require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :player1, :player2, :turn_counter
  def initialize
    create_two_players()
    @turn_counter = 0
  end

  def create_deck_of_shuffled_cards
    full_deck_of_cards = []
    suits = [:heart, :diamond, :spade, :club]

    suits.select do |suit|
      value_map = {"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14}
      value_map.select do |value, rank|
        card = Card.new(suit, value, rank)
        full_deck_of_cards << card
      end
    end
    Deck.new(full_deck_of_cards.shuffle)
  end

  def create_pile_of_cards_for_each_player
    deck = create_deck_of_shuffled_cards()
    deck1 = Deck.new()
    deck2 = Deck.new()
    deck.cards.each do |card|
      if deck1.cards.length < 26
        deck1.add_card(card)
      else
        deck2.add_card(card)
      end
    end
    [deck1, deck2]
  end

  def create_two_players
    both_decks = create_pile_of_cards_for_each_player()
    @player1 = Player.new("Megan", both_decks[0])
    @player2 = Player.new("Aurora", both_decks[1])
  end

  def player_turn
    @turn_counter += 1
    Turn.new(@player1, @player2)
  end

  def start
    until (@player1.has_lost? == true || @player2.has_lost? == true) || @turn_counter >= 1000000
      # @player1.deck.cards.shuffle!
      # @player2.deck.cards.shuffle!
      new_turn = player_turn()
      winner = new_turn.winner
      type = new_turn.type
      new_turn.pile_cards
      new_turn.award_spoils(winner, type)

      if type == :basic
        p "Turn #{@turn_counter} : #{winner.name} won 2 cards"
      elsif type == :war
        p "Turn #{@turn_counter} : WAR - #{winner.name} won 6 cards"
      elsif type == :mutually_assured_destruction
        p "Turn #{@turn_counter} : *mutually assured destruction* 6 cards removed from play"
      end
    end

    if @player1.has_lost? == true
      p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif @player2.has_lost? == true
      p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    elsif @turn_counter >= 1000000
      p "---- DRAW ----"
    else
      p "error"
    end
  end
end
