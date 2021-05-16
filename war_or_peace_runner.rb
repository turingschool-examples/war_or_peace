require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class Runner

  attr_reader :cards, :player1, :player2, :turn_count, :deck1, :deck2, :winner

  def initialize
    cards = make_cards
    deck1 = Deck.new(cards[0..25])
    deck2 = Deck.new(cards[26..51])
    @player1 = Player.new("Megan", deck1)
    @player2 = Player.new("Aurora", deck2)
    @turn_count = 0
    @winner = nil
  end

  def start
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"

    user_input = gets.chomp
    if user_input == "GO"
      until @player1.has_lost? || @player2.has_lost? || @turn_count == 1000000 do
        @turn_count += 1
        turn = Turn.new(player1, player2)
        @winner = turn.winner
        turn.pile_cards
        turn.award_spoils(winner)

        if turn.type == :basic
        puts "Turn #{turn_count}: #{turn.winner.name} won 2 cards"
        elsif turn.type == :war
        puts "Turn #{turn_count}: WAR - #{turn.winner.name} won 6 cards"
        else
        puts "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
        end
      end
      if @turn_count == 1000000
        puts "---- DRAW ----"
      else
        p "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
      end
    else
      p "Please try again!"
    end
  end

  def make_cards
    full_deck = []
    suits = [:club, :diamond, :heart, :spade]
    values = {
      '2' => 2,
      '3' => 3,
      '4' => 4,
      '5' => 5,
      '6' => 6,
      '7' => 7,
      '8' => 8,
      '9' => 9,
      '10' => 10,
      'Jack' => 11,
      'Queen' => 12,
      'King' => 13,
      'Ace' => 14
      }
    suits.each do |suit|
      values.each do |value, rank|
        card = Card.new(suit, value, rank)
        full_deck << card
      end
    end
    full_deck.shuffle
  end
end

Runner.new.start
