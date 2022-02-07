require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/start'
require 'pry'

RSpec.describe Player do
  it 'exists' do
    card1 = Card.new(:heart, 'Ace', 14)
    card2 = Card.new(:heart, 'King', 13)
    card3 = Card.new(:heart, 'Queen', 12)
    card4 = Card.new(:heart, 'Jack', 11)
    card5 = Card.new(:heart, '10', 10)
    card6 = Card.new(:heart, '9', 9)
    card7 = Card.new(:heart, '8', 8)
    card8 = Card.new(:heart, '7', 7)
    card9 = Card.new(:heart, '6', 6)
    card10 = Card.new(:heart, '5', 5)
    card11 = Card.new(:heart, '4', 4)
    card12 = Card.new(:heart, '3', 3)
    card13 = Card.new(:heart, '2', 2)
    card14 = Card.new(:clubs, 'Ace', 14)
    card15 = Card.new(:clubs, 'King', 13)
    card16 = Card.new(:clubs, 'Queen', 12)
    card17 = Card.new(:clubs, 'Jack', 11)
    card18 = Card.new(:clubs, '10', 10)
    card19 = Card.new(:clubs, '9', 9)
    card20 = Card.new(:clubs, '8', 8)
    card21 = Card.new(:clubs, '7', 7)
    card22 = Card.new(:clubs, '6', 6)
    card23 = Card.new(:clubs, '5', 5)
    card24 = Card.new(:clubs, '4', 4)
    card25 = Card.new(:clubs, '3', 3)
    card26 = Card.new(:clubs, '2', 2)
    card14 = Card.new(:spades, 'Ace', 14)
    card15 = Card.new(:spades, 'King', 13)
    card16 = Card.new(:spades, 'Queen', 12)
    card17 = Card.new(:spades, 'Jack', 11)
    card18 = Card.new(:spades, '10', 10)
    card19 = Card.new(:spades, '9', 9)
    card20 = Card.new(:spades, '8', 8)
    card21 = Card.new(:spades, '7', 7)
    card22 = Card.new(:spades, '6', 6)
    card23 = Card.new(:spades, '5', 5)
    card24 = Card.new(:spades, '4', 4)
    card25 = Card.new(:spades, '3', 3)
    card26 = Card.new(:spades, '2', 2)
    card27 = Card.new(:diamonds, 'Ace', 14)
    card28 = Card.new(:diamonds, 'King', 13)
    card29 = Card.new(:diamonds, 'Queen', 12)
    card30 = Card.new(:diamonds, 'Jack', 11)
    card31 = Card.new(:diamonds, '10', 10)
    card32 = Card.new(:diamonds, '9', 9)
    card33 = Card.new(:diamonds, '8', 8)
    card34 = Card.new(:diamonds, '7', 7)
    card35 = Card.new(:diamonds, '6', 6)
    card36 = Card.new(:diamonds, '5', 5)
    card37 = Card.new(:diamonds, '4', 4)
    card38 = Card.new(:diamonds, '3', 3)
    card39 = Card.new(:diamonds, '2', 2)
    card40 = Card.new(:diamonds, 'Ace', 14)
    card41 = Card.new(:diamonds, 'King', 13)
    card42 = Card.new(:diamonds, 'Queen', 12)
    card43 = Card.new(:diamonds, 'Jack', 11)
    card44 = Card.new(:diamonds, '10', 10)
    card45 = Card.new(:diamonds, '9', 9)
    card46 = Card.new(:diamonds, '8', 8)
    card47 = Card.new(:diamonds, '7', 7)
    card48 = Card.new(:diamonds, '6', 6)
    card49 = Card.new(:diamonds, '5', 5)
    card50 = Card.new(:diamonds, '4', 4)
    card51 = Card.new(:diamonds, '3', 3)
    card52 = Card.new(:diamonds, '2', 2)

    deck1 = Deck.new([card30,card26,card3,card4,card7,card6,card5,card9,card21,card10,card11,card25,card8,card14,card15,card16,card17,card18,card19,card20,card1,card22,card23,card24,card12,card13])

    deck2 = Deck.new([card2,card50,card29,card52,card40,card43,card42,card41,card48,card45,card46,card47,card44,card27,card28,card51,card49])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    game1 = Start.new(turn)

    game1

    expect(game1).to be_an_instance_of(Start)
  end
end
