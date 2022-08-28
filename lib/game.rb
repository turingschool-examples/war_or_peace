require "./lib/card.rb"
require "./lib/deck.rb"
require "./lib/player.rb"
require "./lib/turn.rb"

class Game
    attr_reader :full_deck, :player1, :player2, :cards, :deck1, :deck2

def initialize
  @full_deck = create_deck
  @deck1 = @full_deck[0, 26]
  @deck2 = @full_deck[26, 26]
  @player1 = Player.new("Tandy", @deck1) #Player.new("Perrin", deck1)
  @player2 = Player.new("Bill", @deck2) #Player.new("Egwene", deck2)
  @cards = cards
end

def start   #this will be out very last method
  greeting = "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are #{player1.name} and #{player2.name}.
Type 'GO' to start the game!
-------------------------------------------------------------"
  p greeting
  player_start_input = gets.chomp
  require "pry";binding.pry
end


def create_deck
  cards = []

  cards << card1 = Card.new(:heart, "2", 2)
  cards << card2 = Card.new(:heart, "3", 3)
  cards << card3 = Card.new(:heart, "4", 4)
  cards << card4 = Card.new(:heart, "5", 5)
  cards << card5 = Card.new(:heart, "6", 6)
  cards << card6 = Card.new(:heart, "7", 7)
  cards << card7 = Card.new(:heart, "8", 8)
  cards << card8 = Card.new(:heart, "9", 9)
  cards << card9 = Card.new(:heart, "10", 10)
  cards << card10 = Card.new(:heart, "Jack", 11)
  cards << card11 = Card.new(:heart, "Queen", 12)
  cards << card12 = Card.new(:heart, "King", 13)
  cards << card13 = Card.new(:heart, "Ace", 14)
  cards << card14 = Card.new(:diamond, "2", 2)
  cards << card15 = Card.new(:diamond, "3", 3)
  cards << card16 = Card.new(:diamond, "4", 4)
  cards << card17 = Card.new(:diamond, "5", 5)
  cards << card18 = Card.new(:diamond, "6", 6)
  cards << card19 = Card.new(:diamond, "7", 7)
  cards << card20 = Card.new(:diamond, "8", 8)
  cards << card21 = Card.new(:diamond, "9", 9)
  cards << card22 = Card.new(:diamond, "10", 10)
  cards << card23 = Card.new(:diamond, "Jack", 11)
  cards << card24 = Card.new(:diamond, "Queen", 12)
  cards << card25 = Card.new(:diamond, "King", 13)
  cards << card26 = Card.new(:diamond, "Ace", 14)
  cards << card27 = Card.new(:spade, "2", 2)
  cards << card28 = Card.new(:spade, "3", 3)
  cards << card29 = Card.new(:spade, "4", 4)
  cards << card30 = Card.new(:spade, "5", 5)
  cards << card31 = Card.new(:spade, "6", 6)
  cards << card32 = Card.new(:spade, "7", 7)
  cards << card33 = Card.new(:spade, "8", 8)
  cards << card34 = Card.new(:spade, "9", 9)
  cards << card35 = Card.new(:spade, "10", 10)
  cards << card36 = Card.new(:spade, "Jack", 11)
  cards << card37 = Card.new(:spade, "Queen", 12)
  cards << card38 = Card.new(:spade, "King", 13)
  cards << card39 = Card.new(:spade, "Ace", 14)
  cards << card40 = Card.new(:club, "2", 2)
  cards << card41 = Card.new(:club, "3", 3)
  cards << card42 = Card.new(:club, "4", 4)
  cards << card43 = Card.new(:club, "5", 5)
  cards << card44 = Card.new(:club, "6", 6)
  cards << card45 = Card.new(:club, "7", 7)
  cards << card46 = Card.new(:club, "8", 8)
  cards << card47 = Card.new(:club, "9", 9)
  cards << card48 = Card.new(:club, "10", 10)
  cards << card49 = Card.new(:club, "Jack", 11)
  cards << card50 = Card.new(:club, "Queen", 12)
  cards << card51 = Card.new(:club, "King ", 13)
  cards << card52 = Card.new(:club, "Ace", 14)

  full_deck = Deck.new(cards)
  cards.shuffle!
end

def play_new_game
  deck1 = Deck.new(@full_deck[0, 26])
  deck2 = Deck.new(@full_deck[26, 26])
  player1 = Player.new("Perrin", deck1)
  player2 = Player.new("Egwene", deck2)
end
end
# require "pry";binding.pry
#
#
#
#
#
#
#   #How to select group of items from array google search
#   #How to select group of itemfrom
#   # negative numbers for index positions will work from the back of an array
#   #Substrings
#   #.. up to and including (for strings and arrays) can us this in delete and slice to remove huge sections
#   #... is up to and NOT including (for strings and arrays) can use ths in delete and slice to remove huge sections
# #
#
# # def shuffle_deck
# #   full_deck.shuffle!
# # end
#
# # p full_deck.shuffle_deck
