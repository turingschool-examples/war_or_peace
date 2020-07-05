require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require "pry"
deck = []


deck << card_1 = Card.new(:heart, "2", 2)
deck << card_4 = Card.new(:heart, "3", 3)
deck << card_5 = Card.new(:heart, "4", 4)
deck << card_6 = Card.new(:heart, "5", 5)
deck << card_7 = Card.new(:heart, "6", 6)
deck << card_8 = Card.new(:heart, "7", 7)
deck << card_9 = Card.new(:heart, "8", 8)
deck << card_10 = Card.new(:heart, "9", 9)
deck << card_11 = Card.new(:heart, "10", 10)
deck << card_12 = Card.new(:heart, "Jack", 11)
deck << card_13 = Card.new(:heart, "Queen", 12)
deck << card_14 = Card.new(:heart, "King", 13)
deck << card_15 = Card.new(:heart, "Ace", 14)

deck << card_16 = Card.new(:diamond, "2", 2)
deck << card_17 = Card.new(:diamond, "3", 3)
deck << card_18 = Card.new(:diamond, "4", 4)
deck << card_19 = Card.new(:diamond, "5", 5)
deck << card_20 = Card.new(:diamond, "6", 6)
deck << card_21 = Card.new(:diamond, "7", 7)
deck << card_22 = Card.new(:diamond, "8", 8)
deck << card_23 = Card.new(:diamond, "9", 9)
deck << card_24 = Card.new(:diamond, "10", 10)
deck << card_25 = Card.new(:diamond, "Jack", 11)
deck << card_26 = Card.new(:diamond, "Queen", 12)
deck << card_27 = Card.new(:diamond, "King", 13)
deck << card_28 = Card.new(:diamond, "Ace", 14)

deck << card_29 = Card.new(:clubs, "2", 2)
deck << card_30 = Card.new(:clubs, "3", 3)
deck << card_31 = Card.new(:clubs, "4", 4)
deck << card_32 = Card.new(:clubs, "5", 5)
deck << card_33 = Card.new(:clubs, "6", 6)
deck << card_34 = Card.new(:clubs, "7", 7)
deck << card_35 = Card.new(:clubs, "8", 8)
deck << card_36 = Card.new(:clubs, "9", 9)
deck << card_37 = Card.new(:clubs, "10", 10)
deck << card_38 = Card.new(:clubs, "Jack", 11)
deck << card_39 = Card.new(:clubs, "Queen", 12)
deck << card_40 = Card.new(:clubs, "King", 13)
deck << card_41 = Card.new(:clubs, "Ace", 14)

deck << card_42 = Card.new(:spade, "2", 2)
deck << card_43 = Card.new(:spade, "3", 3)
deck << card_44 = Card.new(:spade, "4", 4)
deck << card_45 = Card.new(:spade, "5", 5)
deck << card_46 = Card.new(:spade, "6", 6)
deck << card_47 = Card.new(:spade, "7", 7)
deck << card_48 = Card.new(:spade, "8", 8)
deck << card_49 = Card.new(:spade, "9", 9)
deck << card_50 = Card.new(:spade, "10", 10)
deck << card_51 = Card.new(:spade, "Jack", 11)
deck << card_52 = Card.new(:spade, "Queen", 12)
deck << card_3 = Card.new(:spade, "King", 13)
deck << card_2 = Card.new(:spade, "Ace", 14)

deck.shuffle!
player_1_deck = Deck.new(deck.slice!(0, 26))
player_2_deck = Deck.new(deck.slice!(0, 26))

player_1 = Player.new("Megan", player_1_deck)
player_2 = Player.new("Aurora", player_2_deck)

game = Game.new(player_1, player_2)

game.start
