require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

class Game 
  attr_reader :deck, :player1, :player2, :turn

  def initialize 
    @deck = []
    @player1 = Player.new("Megan", Deck.new(deck[0..25]))
    @player2 = Player.new("Aurora", Deck.new(deck[26..51]))
    @turn = Turn.new(@player1, @player2)
  end

  def create_deck

    @deck << @card1 = Card.new(:spade, '2', 2)
    @deck << @card2 = Card.new(:spade, '3', 3)
    @deck << @card3 = Card.new(:spade, '4', 4)
    @deck << @card4 = Card.new(:spade, '5', 5)
    @deck << @card5 = Card.new(:spade, '6', 6)
    @deck << @card6 = Card.new(:spade, '7', 7)
    @deck << @card7 = Card.new(:spade, '8', 8)
    @deck << @card8 = Card.new(:spade, '9', 9)
    @deck << @card9 = Card.new(:spade, '10', 10)
    @deck << @card10 = Card.new(:spade, 'Jack', 11)
    @deck << @card11 = Card.new(:spade, 'Queen', 12)
    @deck << @card12 = Card.new(:spade, 'King', 13)
    @deck << @card13 = Card.new(:spade, 'Ace', 14)
    @deck << @card14 = Card.new(:diamond, '2', 2)
    @deck << @card15 = Card.new(:diamond, '3', 3)
    @deck << @card16 = Card.new(:diamond, '4', 4)
    @deck << @card17 = Card.new(:diamond, '5', 5)
    @deck << @card18 = Card.new(:diamond, '6', 6)
    @deck << @card19 = Card.new(:diamond, '7', 7)
    @deck << @card20 = Card.new(:diamond, '8', 8)
    @deck << @card21 = Card.new(:diamond, '9', 9)
    @deck << @card22 = Card.new(:diamond, '10', 10)
    @deck << @card23 = Card.new(:diamond, 'Jack', 11)
    @deck << @card24 = Card.new(:diamond, 'Queen', 12)
    @deck << @card25 = Card.new(:diamond, 'King', 13)
    @deck << @card26 = Card.new(:diamond, 'Ace', 14)
    @deck << @card27 = Card.new(:heart, '2', 2)
    @deck << @card28 = Card.new(:heart, '3', 3)
    @deck << @card29 = Card.new(:heart, '4', 4)
    @deck << @card30 = Card.new(:heart, '5', 5)
    @deck << @card31 = Card.new(:heart, '6', 6)
    @deck << @card32 = Card.new(:heart, '7', 7)
    @deck << @card33 = Card.new(:heart, '8', 8)
    @deck << @card34 = Card.new(:heart, '9', 9)
    @deck << @card35 = Card.new(:heart, '10', 10)
    @deck << @card36 = Card.new(:heart, 'Jack', 11)
    @deck << @card37 = Card.new(:heart, 'Queen', 12)
    @deck << @card38 = Card.new(:heart, 'King', 13)
    @deck << @card39 = Card.new(:heart, 'Ace', 14)
    @deck << @card40 = Card.new(:club, '2', 2)
    @deck << @card41 = Card.new(:club, '3', 3)
    @deck << @card42 = Card.new(:club, '4', 4)
    @deck << @card43 = Card.new(:club, '5', 5)
    @deck << @card44 = Card.new(:club, '6', 6)
    @deck << @card45 = Card.new(:club, '7', 7)
    @deck << @card46 = Card.new(:club, '8', 8)
    @deck << @card47 = Card.new(:club, '9', 9)
    @deck << @card48 = Card.new(:club, '10', 10)
    @deck << @card49 = Card.new(:club, 'Jack', 11)
    @deck << @card50 = Card.new(:club, 'Queen', 12)
    @deck << @card51 = Card.new(:club, 'King', 13)
    @deck << @card52 = Card.new(:club, 'Ace', 14)
    @deck.shuffle
  end

  def start 
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are Megan and Aurora."
    p "Type 'GO' to start the game!"
    p '------------------------------------------------------------------'
  end

  start = gets.chomp


  # I am struggling with how to execute actual game play. have reached
  #out to my mentor for additional support in understanding how to 
  #incorporate everything to get the actual game to run. 
  # 
end
  

