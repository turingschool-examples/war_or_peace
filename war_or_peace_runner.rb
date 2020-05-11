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
  def start
    @deck1 = Deck.new([@card1, @card3, @card5, @card7, @card9, @card11, @card13,
       @card15, @card17, @card19, @card21, @card23, @card25, @card27, @card29,
       @card31, @card33, @card35, @card37, @card39, @card41, @card43, @card45,
       @card47, @card49, @card51, @card53, @card55, @card57, @card59, @card61,
       @card63, @card65, @card67, @card69, @card71, @card73, @card75, @card77,
       @card79, @card81, @card83, @card85, @card87, @card89, @card91, @card93,
       @card95, @card97, @card99, @card101, @card103])
    @deck2 = Deck.new([@card2, @card4, @card6, @card8, @card10, @card12,
       @card14, @card16, @card18, @card20, @card22, @card24, @card26, @card28,
       @card30, @card32, @card34, @card36, @card38, @card40, @card42, @card44,
       @card46, @card48, @card50, @card52, @card54, @card56, @card58, @card60,
       @card62, @card64, @card66, @card68, @card70, @card72, @card74, @card76,
       @card78, @card80, @card82, @card84, @card86, @card88, @card90, @card92,
       @card94, @card96, @card98, @card100, @card102, @card104])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn_number = 0
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
  @player1.deck.cards.compact!
  @player2.deck.cards.compact!  # Remove nil from @card assignment
  @player1.deck.cards.shuffle!
  @player2.deck.cards.shuffle!  # Shuffle each player deck
  end

  def turn
    @turn_number += 1
    # if @turn_number == 1500
    #   binding.pry
    # end
    @turn = Turn.new(@player1, @player2)
    @turn.type
    if @turn.type == :mutually_assured_destruction
      puts "*mutually assured destruction* 6 cards removed from play /n"
    end
    @turn.winner
    @winner = @turn.winner
    @turn.pile_cards
    cards_won = @turn.spoils_of_war.size
    @turn.award_spoils(@winner)
    puts "Turn #{@turn_number}: #{@winner} won #{cards_won} cards, #{@player1.deck.cards.size} , #{@player2.deck.cards.size}, #{cards_won} turn type #{@turn.type} , p1 rank #{ @player1.deck.rank_of_card_at(0)} , p2 rank #{ @player2.deck.rank_of_card_at(0)}"
    if @player2.deck.cards.size == 0 && @player1.deck.cards.size >= 1
      puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"
      exit  # Ends Game
    elsif @player1.deck.cards.size == 0 && @player2.deck.cards.size >= 1
      puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
      exit  # Ends Game
    end

  end
end

runner = Runner.new
runner.start  #starts game
runner.build_deck
runner.deal_cards
 x = 0
50.times do
  runner.turn
end
