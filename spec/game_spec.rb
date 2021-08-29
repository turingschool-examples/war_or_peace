require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  it "exist" do
    card1  = Deck.new(:spade, 'Ace', 14)
    card2  = Deck.new(:spade, '2', 2)
    card3  = Deck.new(:spade, '3', 3)
    card4  = Deck.new(:spade, '4', 4)
    card5  = Deck.new(:spade, '5', 5)
    card6  = Deck.new(:spade, '6', 6)
    card7  = Deck.new(:spade, '7', 7)
    card8  = Deck.new(:spade, '8', 8)
    card9  = Deck.new(:spade, '9', 9)
    card10 = Deck.new(:spade, '10', 10)
    card11 = Deck.new(:spade, 'Jack', 11)
    card12 = Deck.new(:spade, 'Queen', 12)
    card13 = Deck.new(:spade, 'King', 13)
    card14 = Deck.new(:heart, 'Ace', 14)
    card15 = Deck.new(:heart, '2', 2)
    card16 = Deck.new(:heart, '3', 3)
    card17 = Deck.new(:heart, '4', 4)
    card18 = Deck.new(:heart, '5', 5)
    card19 = Deck.new(:heart, '6', 6)
    card20 = Deck.new(:heart, '7', 7)
    card21 = Deck.new(:heart, '8', 8)
    card22 = Deck.new(:heart, '9', 9)
    card23 = Deck.new(:heart, '10', 10)
    card24 = Deck.new(:heart, 'Jack', 11)
    card25 = Deck.new(:heart, 'Queen', 12)
    card26 = Deck.new(:heart, 'King', 13)
    card27 = Deck.new(:club, 'Ace', 14)
    card28 = Deck.new(:club, '2', 2)
    card29 = Deck.new(:club, '3', 3)
    card30 = Deck.new(:club, '4', 4)
    card31 = Deck.new(:club, '5', 5)
    card32 = Deck.new(:club, '6', 6)
    card33 = Deck.new(:club, '7', 7)
    card34 = Deck.new(:club, '8', 8)
    card35 = Deck.new(:club, '9', 9)
    card36 = Deck.new(:club, '10', 10)
    card37 = Deck.new(:club, 'Jack', 11)
    card38 = Deck.new(:club, 'Queen', 12)
    card39 = Deck.new(:club, 'King', 13)
    card40 = Deck.new(:diamond, 'Ace', 14)
    card41 = Deck.new(:diamond, '2', 2)
    card42 = Deck.new(:diamond, '3', 3)
    card43 = Deck.new(:diamond, '4', 4)
    card44 = Deck.new(:diamond, '5', 5)
    card45 = Deck.new(:diamond, '6', 6)
    card46 = Deck.new(:diamond, '7', 7)
    card47 = Deck.new(:diamond, '8', 8)
    card48 = Deck.new(:diamond, '9', 9)
    card49 = Deck.new(:diamond, '10', 10)
    card50 = Deck.new(:diamond, 'Jack', 11)
    card51 = Deck.new(:diamond, 'Queen', 12)
    card52 = Deck.new(:diamond, 'King', 13)
    full_deck = [card1,card2,card3,card4,card5,card6,card7,card8,card9,card10,card11,card12,card13,card14,card15,card16,card17,card18,card19,card20,card21,card22,card23,card24,card25,card266,card27,card28,card29,card30,card31,card32,card33,card34,card35,card36,card37,card38,card39,card40,card41,card42,card43,card44,card45,card46,card47,card48,card49,card50,card50,card51,card52]
    deck1 = []
    deck2 = []
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    @game = Game.new(@player1, @player2)
    expect(@game).to be_an_instance_of(Game)

  end
end
