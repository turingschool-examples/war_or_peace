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
    deck = Deck.new(full_deck_of_cards.shuffle)
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

    p "Welcome to War! (or Peace) This game will be played with 52 cards.
      The players today are Megan and Aurora.
      Type 'GO' to start the game!
      ------------------------------------------------------------------"

    answer = gets.chomp

    if answer == "GO"
      until (@player1.deck.cards.length == 0 || @player2.deck.cards.length == 0) || @turn_counter >= 1000000
        # require "pry"; binding.pry
        new_turn = player_turn()
        winner = new_turn.winner
        new_turn.pile_cards
        new_turn.award_spoils(winner)
        if new_turn.type == :basic
          p "Turn #{@turn_counter} : #{winner.name} won 2 cards"
        elsif new_turn.type == :war
          p "Turn #{@turn_counter} : WAR - #{winner.name} won 6 cards"
        elsif new_turn.type == :mutually_assured_destruction
          p "Turn #{@turn_counter} : *mutually assured destruction* 6 cards removed from play"
        end
      end
      if @player1.deck.cards.length == 0
        p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
      elsif @player2.deck.cards.length == 0
        p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
      elsif @turn_counter >= 1000000
        p "---- DRAW ----"
      else
        p "error"
      end

    elsif answer != "GO"
      p "Please type 'GO' to begin the game!"
      # answer2 = gets.chomp
    end

  end



end
