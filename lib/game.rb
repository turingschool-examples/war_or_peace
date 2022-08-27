require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'
require 'pry'

class Game
  attr_accessor :turn, :turn_type, :hand_winner, :full_deck

  def initialize(turn)
    @turn = turn
    @turn_type = @turn.type
    @hand_winner = @turn.winner
    @full_deck = []
  end

  def start(player1, player2)
    create_full_deck
    puts ''
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Press 'RETURN' to start the game"
    puts '------------------------------------------------------------------'
    gets
    puts ''
    puts 'here we go!'
    puts ''
    puts ''
  end

  def create_full_deck
    values = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    values_and_ranks = values.zip(ranks)
    values_and_ranks.map do |x|
      full_deck << [x, :diamond].flatten
      full_deck << [x, :heart].flatten
      full_deck << [x, :spade].flatten
      full_deck << [x, :club].flatten
    end

    @full_deck = full_deck.map do |x|
      Card.new(x[2], x[0], x[1])
    end
  end

  def game_over?
    @turn.player1.has_lost? || @turn.player2.has_lost?
  end

  # def endgame?
  #   turn.player1.deck.cards.length < 3 || turn.player2.deck.cards.length < 3
  # end

  # def three_card_endgame?
  #   turn.player1.deck.cards.length == 3 || turn.player2.deck.cards.length == 3
  # end

  def two_card_endgame?
    turn.player1.deck.cards.length == 2 || turn.player2.deck.cards.length == 2
  end

  def one_card_endgame?
    turn.player1.deck.cards.length == 1 || turn.player2.deck.cards.length == 1
  end

  def one_card_endgame
    if turn.player1.deck.cards[0].rank < turn.player2.deck.cards[0].rank
      turn.player2.deck.cards << turn.player1.deck.cards.pop
    else
      turn.player1.deck.cards << turn.player2.deck.cards.pop
    end
  end

  def two_card_endgame(counter)
    case turn.type
    when :basic
      normal_game_play(counter)
    when :war
      if hand_winner == turn.player1
        turn.player1.deck.cards.concat(turn.player2.deck.cards.pop(2))
      elsif hand_winner == turn.player2
        turn.player2.deck.cards.concat(turn.player1.deck.cards.pop(2))
      end

    else
      'not allowed'
    end
  end

  def normal_game_play(counter)
    case turn_type
    when :mutually_assured_destruction
      turn.pile_cards
      p "turn #{counter}: No winner: mutually assured destruction 6 cards removed"
      p "Megan: #{turn.player1.deck.cards.count}| Aurora: #{turn.player2.deck.cards.count}"
    when :war
      turn.pile_cards
      p "turn #{counter}: WAR -  #{hand_winner.name} won #{turn.spoils_of_war.count} cards"
      turn.award_spoils(hand_winner)
      p "Megan: #{turn.player1.deck.cards.count}| Aurora: #{turn.player2.deck.cards.count}"
    when :basic
      turn.pile_cards
      p "turn #{counter}: #{hand_winner.name} won #{turn.spoils_of_war.count} cards"
      turn.award_spoils(hand_winner)
      p "Megan: #{turn.player1.deck.cards.count}| Aurora: #{turn.player2.deck.cards.count}"
    else
      'uh oh'
    end
  end
end
