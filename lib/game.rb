require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/player'
require 'pry'

class Game
  attr_accessor :turn,
                :turn_type,
                :hand_winner,
                :full_deck,
                :deck1,
                :deck2,
                :player1,
                :player2,
                :counter

  def initialize
    @turn = nil
    @full_deck = []
    @deck1 = nil
    @deck2 = nil
    @player1 = nil
    @player2 = nil
    @counter = 1
  end

  def start
    create_full_deck
    shuffle_the_deck
    split_deck
    create_players
    make_turn
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{@player1.name} and #{@player2.name}."
    puts "Press 'RETURN' to start the game"
    puts '------------------------------------------------------------------'
    gets
    game_loop
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

  def shuffle_the_deck
    @full_deck = @full_deck.shuffle
  end

  def split_deck
    @deck1 = Deck.new(full_deck.slice!(0, 26))
    @deck2 = Deck.new(full_deck)
  end

  def create_players
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
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

  def two_card_endgame(counter)
    case turn.type
    when :basic
      normal_game_play(counter)
    when :war
      if @player2.deck.cards[2].nil?
        turn.player1.deck.cards.concat(turn.player2.deck.cards.pop(2))
      elsif @player1.deck.cards[2].nil?
        turn.player2.deck.cards.concat(turn.player1.deck.cards.pop(2))
      end

    else
      'not allowed'
    end
  end

  def one_card_endgame?
    turn.player1.deck.cards.length == 1 || turn.player2.deck.cards.length == 1
  end

  def one_card_endgame
    if @turn.player1.deck.cards[0].rank < @turn.player2.deck.cards[0].rank
      turn.player2.deck.cards << turn.player1.deck.cards.pop
    else
      turn.player1.deck.cards << turn.player2.deck.cards.pop
    end
  end

  def normal_game_play(counter)
    winner = turn.winner
    case @turn.type
    when :mutually_assured_destruction
      turn.pile_cards
      p "turn #{counter}: No winner: mutually assured destruction 6 cards removed"
      p "Megan: #{turn.player1.deck.cards.count}| Aurora: #{turn.player2.deck.cards.count}"
    when :war
      turn.pile_cards
      p "turn #{counter}: WAR -  #{winner.name} won #{turn.spoils_of_war.count} cards"
      turn.award_spoils(winner)
      p "Megan: #{turn.player1.deck.cards.count}| Aurora: #{turn.player2.deck.cards.count}"
    when :basic
      turn.pile_cards
      p "turn #{counter}: #{winner.name} won #{turn.spoils_of_war.count} cards"
      turn.award_spoils(winner)
      p "Megan: #{turn.player1.deck.cards.count}| Aurora: #{turn.player2.deck.cards.count}"
    else
      'uh oh'
    end
  end

  def make_turn
    @turn = Turn.new(@player1, @player2)
  end

  def game_over
    if @player1.has_lost?
      puts "*~*~*~* #{player2.name} has won the game! *~*~*~*"
    elsif @player2.has_lost?
      puts "*~*~*~* #{player1.name} has won the game! *~*~*~*"
    elsif @counter >= 10_000
      puts "Turn #{counter}: #{turn.winner.name} won 2 cards"
      puts '---- DRAW ----'
    end
  end

  def game_loop
    until counter == 1_000

      if game_over? # game over
        game_over
        break
      elsif two_card_endgame?
        two_card_endgame(@counter)
      elsif one_card_endgame?
        one_card_endgame
      else
        normal_game_play(@counter)
      end

      @turn = Turn.new(@turn.player1, @turn.player2)
      # game = Game.new

      @counter += 1

    end
  end
end
