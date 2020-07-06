require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/card_generator'

class Game
  def split_and_create_decks
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    full_deck = cards.create_cards
    shuffled_deck = full_deck.shuffle
    decks = [shuffled_deck[0..25], shuffled_deck[26..51]]
  end

  def create_players
    decks = split_and_create_decks
    deck1 = Deck.new(decks[0])
    deck2 = Deck.new(decks[1])
    [player1 = Player.new("Megan", deck1), player2 = Player.new("Aurora", deck2)]
  end

  def create_turn
    players = create_players
    player1 = create_players[0]
    player2 = create_players[1]
    Turn.new(player1, player2)
  end

  def start
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    starter = gets.chomp.upcase
    if starter == "GO"
      # Creates the deck and both players
      turn = create_turn
      turn_num = 1
      # Conitnue until 1,000,000 turn or a players deck is empty
      while turn_num < 1000001 and turn.player1.deck.cards.empty? == false and turn.player2.deck.cards.empty? == false do
        type = turn.type
        if type == :war
          winner = turn.winner_war
          p "turn #{turn_num}: #{type.upcase} #{winner.name} won #{turn.pile_cards.flatten!.size} cards."
          turn.award_spoils(winner)
          turn.remove_cards_from_player
        elsif type == :basic
          winner = turn.winner_basic
          p "turn #{turn_num}: #{type} #{winner_name = turn.winner_basic.name} won #{cards = turn.pile_cards.size} cards."
          turn.award_spoils(winner)
          turn.remove_cards_from_player
        elsif type == :mutually_assured_destruction
          p "turn #{turn_num}: *#{type}* #{turn.pile_cards.flatten!.size} removed from play."
          turn.remove_cards_from_player
        end
        turn_num += 1
        if turn.player1.deck.cards.empty? == true
          p "Aurora won the game!"
        elsif turn.player2.deck.cards.empty? == true
          p "Megan won the game!"
        elsif turn_num == 1000001
          p "--- DRAW ---"
          p "Aurora has #{turn.player2.deck.cards.size} cards left."
          p "Megan has #{turn.player1.deck.cards.size} cards left."
        end
      end
    end
  end
end
game = Game.new
game.start
