require 'rspec'
require 'card.rb'
require 'deck.rb'
require 'player.rb'
require 'turn.rb'


card_1 = Card.new(:spade, "2", 2)
card_2 = Card.new(:club, "2", 2)
card_3 = Card.new(:heart, "2", 2)
card_4 = Card.new(:diamond, "2", 2)

card_5 = Card.new(:spade, "3", 3)
card_6 = Card.new(:club, "3", 3)
card_7 = Card.new(:heart, "3", 3)
card_8 = Card.new(:diamond, "3", 3)

card_9 = Card.new(:spade, "4", 4)
card_10 = Card.new(:club, "4", 4)
card_11 = Card.new(:heart, "4", 4)
card_12 = Card.new(:diamond, "4", 4)

card_13= Card.new(:spade, "5", 5)
card_14 = Card.new(:club, "5", 5)
card_15 = Card.new(:heart, "5", 5)
card_16 = Card.new(:diamond, "5", 5)

card_17 = Card.new(:spade, "6", 6)
card_18 = Card.new(:club, "6", 6)
card_19 = Card.new(:heart, "6", 6)
card_20 = Card.new(:diamond, "6", 6)

card_21 = Card.new(:spade, "7", 7)
card_22 = Card.new(:club, "7", 7)
card_23 = Card.new(:heart, "7", 7)
card_24 = Card.new(:diamond, "7", 7)

card_25 = Card.new(:spade, "8", 8)
card_26 = Card.new(:club, "8", 8)
card_27 = Card.new(:heart, "8", 8)
card_28 = Card.new(:diamond, "8", 8)

card_29 = Card.new(:spade, "9", 9)
card_30 = Card.new(:club, "9", 9)
card_31 = Card.new(:heart, "9", 9)
card_32 = Card.new(:diamond, "9", 9)

card_33 = Card.new(:spade, "10", 10)
card_34 = Card.new(:club, "10", 10)
card_35 = Card.new(:heart, "10", 10)
card_36 = Card.new(:diamond, "10", 10)

card_37 = Card.new(:spade, "Jack", 11)
card_38 = Card.new(:club, "Jack", 11)
card_39 = Card.new(:heart, "Jack", 11)
card_40 = Card.new(:diamond, "Jack", 11)

card_41 = Card.new(:spade, "Queen", 12)
card_42 = Card.new(:club, "Queen", 12)
card_43 = Card.new(:heart, "Queen", 12)
card_44 = Card.new(:diamond, "Queen", 12)

card_45 = Card.new(:spade, "King", 13)
card_46 = Card.new(:club, "King", 13)
card_47 = Card.new(:heart, "King", 13)
card_48 = Card.new(:diamond, "King", 13)

card_49 = Card.new(:spade, "Ace", 14)
card_50 = Card.new(:club, "Ace", 14)
card_51 = Card.new(:heart, "Ace", 14)
card_52 = Card.new(:diamond, "Ace", 14)

deck = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9, card_10, card_11, card_12, card_13, card_14, card_15, card_16, card_17, card_18, card_19, card_20, card_21, card_22, card_23, card_24, card_25, card_26, card_27, card_28, card_29, card_30, card_31, card_32, card_33, card_34, card_35, card_36, card_37, card_38, card_39, card_40, card_41, card_42, card_43, card_44, card_45, card_46, card_47, card_48, card_49, card_50, card_51, card_52]

deck_1 = Deck.new(deck.shuffle.slice(0, 25))
deck_2 = Deck.new(deck.shuffle.slice(26, 51))

player_1 = Player.new("Megan", deck_1)
player_2 = Player.new("Aurora", deck_2)













