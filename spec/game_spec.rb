require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

describe Game do
  it "exists" do
    game = Game.new

    expect(game).to be_an_instance_of(Game)
  end

  it "can make an accurate deck of 52 cards" do
    card1 = Card.new(:diamond, "Ace", 14)
    card2 = Card.new(:diamond, "2", 2)
    card3 = Card.new(:diamond, "3", 3)
    card4 = Card.new(:diamond, "4", 4)
    card5 = Card.new(:diamond, "5", 5)
    card6 = Card.new(:diamond, "6", 6)
    card7 = Card.new(:diamond, "7", 7)
    card8 = Card.new(:diamond, "8", 8)
    card9 = Card.new(:diamond, "9", 9)
    card10 = Card.new(:diamond, "10", 10)
    card11 = Card.new(:diamond, "Jack", 11)
    card12 = Card.new(:diamond, "Queen", 12)
    card13 = Card.new(:diamond, "King", 13)

    card14 = Card.new(:heart, "Ace", 14)
    card15 = Card.new(:heart, "2", 2)
    card16 = Card.new(:heart, "3", 3)
    card17 = Card.new(:heart, "4", 4)
    card18 = Card.new(:heart, "5", 5)
    card19 = Card.new(:heart, "6", 6)
    card20 = Card.new(:heart, "7", 7)
    card21 = Card.new(:heart, "8", 8)
    card22 = Card.new(:heart, "9", 9)
    card23 = Card.new(:heart, "10", 10)
    card24 = Card.new(:heart, "Jack", 11)
    card25 = Card.new(:heart, "Queen", 12)
    card26 = Card.new(:heart, "King", 13)

    card27 = Card.new(:club, "Ace", 14)
    card28 = Card.new(:club, "2", 2)
    card29 = Card.new(:club, "3", 3)
    card30 = Card.new(:club, "4", 4)
    card31 = Card.new(:club, "6", 5)
    card32 = Card.new(:club, "6", 6)
    card33 = Card.new(:club, "7", 7)
    card34 = Card.new(:club, "8", 8)
    card35 = Card.new(:club, "9", 9)
    card36 = Card.new(:club, "10", 10)
    card37 = Card.new(:club, "Jack", 11)
    card38 = Card.new(:club, "Queen", 12)
    card39 = Card.new(:club, "King", 13)

    card40 = Card.new(:spade, "Ace", 14)
    card41 = Card.new(:spade, "2", 2)
    card42 = Card.new(:spade, "3", 3)
    card43 = Card.new(:spade, "4", 4)
    card44 = Card.new(:spade, "5", 5)
    card45 = Card.new(:spade, "6", 6)
    card46 = Card.new(:spade, "7", 7)
    card47 = Card.new(:spade, "8", 8)
    card48 = Card.new(:spade, "9", 9)
    card49 = Card.new(:spade, "10", 10)
    card50 = Card.new(:spade, "Jack", 11)
    card51 = Card.new(:spade, "Queen", 12)
    card52 = Card.new(:spade, "King", 13)

    full_deck = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52])
    game = Game.new

    expect(game.full_deck.cards).to eq(game.make_new_deck.cards)

  end

  xit "Can shuffle a deck" do
    card1 = Card.new(:diamond, "Ace", 14)
    card2 = Card.new(:diamond, "2", 2)
    card3 = Card.new(:diamond, "3", 3)
    card4 = Card.new(:diamond, "4", 4)
    card5 = Card.new(:diamond, "5", 5)
    card6 = Card.new(:diamond, "6", 6)
    card7 = Card.new(:diamond, "7", 7)
    card8 = Card.new(:diamond, "8", 8)
    card9 = Card.new(:diamond, "9", 9)
    card10 = Card.new(:diamond, "10", 10)
    card11 = Card.new(:diamond, "Jack", 11)
    card12 = Card.new(:diamond, "Queen", 12)
    card13 = Card.new(:diamond, "King", 13)

    card14 = Card.new(:heart, "Ace", 14)
    card15 = Card.new(:heart, "2", 2)
    card16 = Card.new(:heart, "3", 3)
    card17 = Card.new(:heart, "4", 4)
    card18 = Card.new(:heart, "5", 5)
    card19 = Card.new(:heart, "6", 6)
    card20 = Card.new(:heart, "7", 7)
    card21 = Card.new(:heart, "8", 8)
    card22 = Card.new(:heart, "9", 9)
    card23 = Card.new(:heart, "10", 10)
    card24 = Card.new(:heart, "Jack", 11)
    card25 = Card.new(:heart, "Queen", 12)
    card26 = Card.new(:heart, "King", 13)

    card27 = Card.new(:club, "Ace", 14)
    card28 = Card.new(:club, "2", 2)
    card29 = Card.new(:club, "3", 3)
    card30 = Card.new(:club, "4", 4)
    card31 = Card.new(:club, "6", 5)
    card32 = Card.new(:club, "6", 6)
    card33 = Card.new(:club, "7", 7)
    card34 = Card.new(:club, "8", 8)
    card35 = Card.new(:club, "9", 9)
    card36 = Card.new(:club, "10", 10)
    card37 = Card.new(:club, "Jack", 11)
    card38 = Card.new(:club, "Queen", 12)
    card39 = Card.new(:club, "King", 13)

    card40 = Card.new(:spade, "Ace", 14)
    card41 = Card.new(:spade, "2", 2)
    card42 = Card.new(:spade, "3", 3)
    card43 = Card.new(:spade, "4", 4)
    card44 = Card.new(:spade, "5", 5)
    card45 = Card.new(:spade, "6", 6)
    card46 = Card.new(:spade, "7", 7)
    card47 = Card.new(:spade, "8", 8)
    card48 = Card.new(:spade, "9", 9)
    card49 = Card.new(:spade, "10", 10)
    card50 = Card.new(:spade, "Jack", 11)
    card51 = Card.new(:spade, "Queen", 12)
    card52 = Card.new(:spade, "King", 13)

    full_deck = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52])
    game = Game.new

    puts game.shuffle_deck

      #this is probably not the way, look up to not_eq ???
    # expect(game.full_deck).not_to eq(game.shuffle_deck)
  end




end




# card1 = Card.new(:diamond, "Ace", 14)
# card2 = Card.new(:diamond, "2", 2)
# card3 = Card.new(:diamond, "3", 3)
# card4 = Card.new(:diamond, "4", 4)
# card5 = Card.new(:diamond, "5", 5)
# card6 = Card.new(:diamond, "6", 6)
# card7 = Card.new(:diamond, "7", 7)
# card8 = Card.new(:diamond, "8", 8)
# card9 = Card.new(:diamond, "9", 9)
# card10 = Card.new(:diamond, "10", 10)
# card11 = Card.new(:diamond, "Jack", 11)
# card12 = Card.new(:diamond, "Queen", 12)
# card13 = Card.new(:diamond, "King", 13)
#
# card14 = Card.new(:heart, "14", 14)
# card15 = Card.new(:heart, "2", 2)
# card16 = Card.new(:heart, "3", 3)
# card17 = Card.new(:heart, "4", 4)
# card18 = Card.new(:heart, "5", 5)
# card19 = Card.new(:heart, "6", 6)
# card20 = Card.new(:heart, "7", 7)
# card21 = Card.new(:heart, "8", 8)
# card22 = Card.new(:heart, "9", 9)
# card23 = Card.new(:heart, "10", 10)
# card24 = Card.new(:heart, "Jack", 11)
# card25 = Card.new(:heart, "Queen", 12)
# card26 = Card.new(:heart, "King", 13)
#
# card27 = Card.new(:club, "Ace", 14)
# card28 = Card.new(:club, "2", 2)
# card29 = Card.new(:club, "3", 3)
# card30 = Card.new(:club, "4", 4)
# card31 = Card.new(:club, "6", 5)
# card32 = Card.new(:club, "6", 6)
# card33 = Card.new(:club, "7", 7)
# card34 = Card.new(:club, "8", 8)
# card35 = Card.new(:club, "9", 9)
# card36 = Card.new(:club, "10", 10)
# card37 = Card.new(:club, "Jack", 11)
# card38 = Card.new(:club, "Queen", 12)
# card39 = Card.new(:club, "King", 13)
#
# card40 = Card.new(:spade, "Ace", 14)
# card41 = Card.new(:spade, "2", 2)
# card42 = Card.new(:spade, "3", 3)
# card43 = Card.new(:spade, "4", 4)
# card44 = Card.new(:spade, "5", 5)
# card45 = Card.new(:spade, "6", 6)
# card46 = Card.new(:spade, "7", 7)
# card47 = Card.new(:spade, "8", 8)
# card48 = Card.new(:spade, "9", 9)
# card49 = Card.new(:spade, "10", 10)
# card50 = Card.new(:spade, "Jack", 11)
# card51 = Card.new(:spade, "Queen", 12)
# card52 = Card.new(:spade, "King", 13)
#
# complete_deck = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52])
