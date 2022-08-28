require 'rspec'
require 'pry'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
# from here to war_or_peace runner to play gameplay
#Order matters
#how does the match start-end
class Game
   attr_reader :deck,
               :player1,
               :player2,
               :turn,
               :full_deck,
               :deck1,
               :deck2

     def initialize
      @full_deck = new_deck
      @deck1 = @full_deck[0, 26]
      @deck2 = @full_deck[26, 26]
      @player1 = Player.new("Megan", @deck1)
      @player2 = Player.new("Aurora", @deck2)
      @turn = turn
      @turn_start = turn_start
     end

    def new_deck
      cards = []

      cards << card1 = Card.new(:heart, 'Jack', 11)
      cards << card2 = Card.new(:heart, '10', 10)
      cards << card3 = Card.new(:heart, '9', 9)
      cards << card4 = Card.new(:diamond, 'Jack', 11)
      cards << card5 = Card.new(:heart, '8', 8)
      cards << card6 = Card.new(:diamond, '8', 8)
      cards << card7 = Card.new(:heart, '3', 3)
      cards << card8 = Card.new(:diamond, '2', 2)
      cards << card9 = Card.new(:club,'9',9)
      cards << card10 = Card.new(:diamond,'4',4)
      cards << card11 = Card.new(:spade,'10',10)
      cards << card12 = Card.new(:spade,'Jack',11)
      cards << card13 = Card.new(:club,'6',6)
      cards << card14 = Card.new(:spade,'2',2)
      cards << card15 = Card.new(:spade,'8',8)
      cards << card16 = Card.new(:diamond,'Queen',12)
      cards << card17 = Card.new(:club,'5',5)
      cards << card18 = Card.new(:spade,'4',4)
      cards << card19 = Card.new(:club,'3',3)
      cards << card20 = Card.new(:club,'Ace',14)
      cards << card21 = Card.new(:spade,'5',5)
      cards << card22 = Card.new(:heart,'6',6)
      cards << card23 = Card.new(:club,'7',7)
      cards << card24 = Card.new(:spade,'King',13)
      cards << card25 = Card.new(:diamond,'Ace',14)
      cards << card26 = Card.new(:diamond,'6',6)
      cards << card27 = Card.new(:spade,'9',9)
      cards << card28 = Card.new(:heart,'4',4)
      cards << card29 = Card.new(:spade,'7',7)
      cards << card30 = Card.new(:diamond,'10',10)
      cards << card31 = Card.new(:heart,'5',5)
      cards << card32 = Card.new(:club,'Jack',11)
      cards << card33 = Card.new(:heart,'7',7)
      cards << card34 = Card.new(:heart,'Queen',12)
      cards << card35 = Card.new(:heart,'2',2)
      cards << card36 = Card.new(:diamond,'King',13)
      cards << card37 = Card.new(:club,'8',8)
      cards << card38 = Card.new(:spade,'Jack',11)
      cards << card39 = Card.new(:club,'2',2)
      cards << card40 = Card.new(:diamond,'3',3)
      cards << card41 = Card.new(:club,'Queen',12)
      cards << card42 = Card.new(:diamond,'7',7)
      cards << card43 = Card.new(:heart,'King',13)
      cards << card44 = Card.new(:spade,'3',3)
      cards << card45 = Card.new(:spade,'Queen',12)
      cards << card46 = Card.new(:club,'4',4)
      cards << card47 = Card.new(:club,'10',10)
      cards << card48 = Card.new(:diamond,'5',5)
      cards << card49 = Card.new(:club,'King',13)
      cards << card50 = Card.new(:spade,'6',6)
      cards << card51 = Card.new(:diamond,'9',9)
      cards << card52 = Card.new(:heart,'Ace',14)
      @full_deck = Deck.new(cards)
      cards.shuffle!
      # deck1 = Deck.new(@full_deck.cards[0, 26])
      # deck2 = Deck.new(@full_deck.cards[26, 26])

    end

    def start
      welcome = "Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------"
 p welcome
 @turn_count = 0
 play_start
  end
  turn = turn.new(player1, player2)
  binding.pry
  @turn_count = 1


  # def play_start
#unsure of how to corilate user typing go to make this work


# deck1 = [card1, card3, card5, card7, card10, card11, card13, card16, card19, card20, card22, card24, card26, card28, card30, card32, card34, card36, card39, card42, card44, card45, card46, card49, card50 card52]
# deck2 = [card2, card4, card6, card8, card9, card12, card14, card15, card16, card17, card18, card21, card23, card25, card29, card31, card33, card35, card37, card38, card40, card41, card43, card47, card48, card51]
end
