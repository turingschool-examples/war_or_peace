require './lib/standard_deck'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Game
  attr_reader :standard_deck,
              :deck1,
              :deck2,
              :player1,
              :player2

  def initialize
    @standard_deck = StandardDeck.new
    @turns = []
  end

  def split_deck
    @standard_deck.create_standard_deck
    shuffled_deck = @standard_deck.cards.shuffle
    @deck1 = Deck.new(shuffled_deck[0..25])
    @deck2 = Deck.new(shuffled_deck[26..52])
  end

  def create_two_players(player1_name, player2_name)
    split_deck
    @player1 = Player.new(player1_name, @deck1)
    @player2 = Player.new(player2_name, @deck2)
  end

  def take_turn
    @turns << Turn.new(@player1, @player2)
    if @turns.count > 0
      turn_type_response(@turns.length)
    end
  end

  def turn_type_response(turn_number)
    print "Turn #{turn_number}: "
    if @turns.last.type == :basic
      print "#{@turns.last.winner.name} won "
      @turns.last.pile_cards
      puts "#{@turns.last.spoils_of_war.length} cards"
      @turns.last.award_spoils(@turns.last.winner)
    elsif @turns.last.type == :war
      print "#{@turns.last.type.upcase} - #{@turns.last.winner.name} won "
      @turns.last.pile_cards
      puts "#{@turns.last.spoils_of_war.length} cards"
      @turns.last.award_spoils(@turns.last.winner)
    elsif @turns.last.type == :mutually_assured_destruction
      puts "*#{@turns.last.type}* 6 cards removed from play"
      @turns.last.pile_cards
    end
  end

  def start
    create_two_players("Angel", "Amber")
    greeting
    user_input = gets.chomp
    while user_input.upcase != "GO"
      puts "Invalid Input. Try again: "
      user_input = gets.chomp
    end
    while !game_over?
      if @turns.length < 1000000
        take_turn
      else
        puts "DRAW".center(14, "-")
      end
    end
      display_winner
  end

  def game_over?
    @player1.deck.cards.length <= 3 || @player2.deck.cards.length <= 3
  end

  def greeting
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{@player1.name} and #{@player2.name}."
    puts "Type 'GO' to start the game!"
    50.times do
      print "-"
    end
    puts "\n"
  end

  def display_winner
    if @player1.deck.cards.length > @player2.deck.cards.length
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
    else
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
    end
  end
end
