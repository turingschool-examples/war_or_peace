# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/deck_builder'
require 'pry'

puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are Megan and Aurora."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"
input = gets.chomp


class Runner
  attr_reader :deck_builder
  def menu
    @deck1 = Deck.new([@card1, @card3, @card5, @card7, @card9, @card11, @card13,
      @card15, @card17, @card19, @card21, @card23, @card25, @card27, @card29,
      @card31, @card33, @card35, @card37, @card39, @card41, @card43, @card45,
      @card47, @card49, @card51])
    @deck2 = Deck.new([@card2, @card4, @card6, @card8, @card10, @card12,
      @card14, @card16, @card18, @card20, @card22, @card24, @card26, @card28,
      @card30, @card32, @card34, @card36, @card38, @card40, @card42, @card44,
      @card46, @card48, @card50, @card52])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    # @turn = Turn.new(@player1, @player2)
  end

  def build_deck
    @deck_builder = DeckBuilder.new
    @deck_builder.build_deck
    @deck_builder.new_deck.shuffle!
  end

  def deal_cards
    #these counters are for indexing below
    counter = 0
    x = 0
    i = 0
    @deck_builder.new_deck.each do |card|
      counter += 1
      # Deals out to both players
      if counter.odd?
        @player1.deck.cards[x] = card
        x = x + 1
      elsif counter.even?
        @player2.deck.cards[i] = card
        i = i + 1
      end
    end
  end

def turn
  @turn = Turn.new(@player1, @player2)
  @turn.type
  @turn.winner
  @turn.pile_cards
  @turn.award_spoils(@winner)
  binding.pry

end


end

runner = Runner.new
runner.menu
runner.build_deck
runner.deal_cards
runner.turn
