require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/generator'

class Game

  attr_reader :player1, :player2, :round_count, :deck

  def initialize
    @deck = Generator.new("./lib/cards.txt").cards.shuffle
    @round_count = 0
    @deck1 = Deck.new([])
    @deck2 = Deck.new([])
    @player1 = Player.new('Megan', @deck1)
    @player2 = Player.new('Aurora', @deck2)
  end

  def deal
    26.times do
      @player1.deck.cards << @deck.shift
      @player2.deck.cards << @deck.shift
    end
  end

  def start
    until gets.chomp.upcase == 'GO'
      puts "Please type 'go' to start"
    end
  end

  def take_turn
    @round_count += 1
    @turn = Turn.new(@player1, @player2)
    @turn.type
    @winner = @turn.winner
    print_to_screen
    @turn.pile_cards
    @turn.award_spoils
  end

  def print_to_screen
    if @turn.type == :basic
      p "Turn #{@round_count}: #{@winner.name} won 2 cards."
    elsif @turn.type == :war
      p "Turn #{@round_count}: War - #{@winner.name} won 6 cards."
    else
      p "*mutually assured destruction* 6 cards removed from play."
    end
  end

end
