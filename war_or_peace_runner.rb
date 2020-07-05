require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

# Hard code cards
card_1 = Card.new(:club, 'Two', 2)
card_2 = Card.new(:club, 'Three', 3)
card_3 = Card.new(:club, 'Four', 4)
card_4 = Card.new(:club, 'Five', 5)
card_5 = Card.new(:club, 'Six', 6)
card_6 = Card.new(:club, 'Seven', 7)
card_7 = Card.new(:club, 'Eight', 8)
card_8 = Card.new(:club, 'Nine', 9)
card_9 = Card.new(:club, 'Ten', 10)
card_10 = Card.new(:club, 'Jack', 11)
card_11 = Card.new(:club, 'Queen', 12)
card_12 = Card.new(:club, 'King', 13)
card_13 = Card.new(:club, 'Ace', 14)
card_14 = Card.new(:diamond, 'Two', 2)
card_15 = Card.new(:diamond, 'Three', 3)
card_16 = Card.new(:diamond, 'Four', 4)
card_17 = Card.new(:diamond, 'Five', 5)
card_18 = Card.new(:diamond, 'Six', 6)
card_19 = Card.new(:diamond, 'Seven', 7)
card_20 = Card.new(:diamond, 'Eight', 8)
card_21 = Card.new(:diamond, 'Nine', 9)
card_22 = Card.new(:diamond, 'Ten', 10)
card_23 = Card.new(:diamond, 'Jack', 11)
card_24 = Card.new(:diamond, 'Queen', 12)
card_25 = Card.new(:diamond, 'King', 13)
card_26 = Card.new(:diamond, 'Ace', 14)
card_27 = Card.new(:heart, 'Two', 2)
card_28 = Card.new(:heart, 'Three', 3)
card_29 = Card.new(:heart, 'Four', 4)
card_30 = Card.new(:heart, 'Five', 5)
card_31 = Card.new(:heart, 'Six', 6)
card_32 = Card.new(:heart, 'Seven', 7)
card_33 = Card.new(:heart, 'Eight', 8)
card_34 = Card.new(:heart, 'Nine', 9)
card_35 = Card.new(:heart, 'Ten', 10)
card_36 = Card.new(:heart, 'Jack', 11)
card_37 = Card.new(:heart, 'Queen', 12)
card_38 = Card.new(:heart, 'King', 13)
card_39 = Card.new(:heart, 'Ace', 14)
card_40 = Card.new(:spade, 'Two', 2)
card_41 = Card.new(:spade, 'Three', 3)
card_42 = Card.new(:spade, 'Four', 4)
card_43 = Card.new(:spade, 'Five', 5)
card_44 = Card.new(:spade, 'Six', 6)
card_45 = Card.new(:spade, 'Seven', 7)
card_46 = Card.new(:spade, 'Eight', 8)
card_47 = Card.new(:spade, 'Nine', 9)
card_48 = Card.new(:spade, 'Ten', 10)
card_49 = Card.new(:spade, 'Jack', 11)
card_50 = Card.new(:spade, 'Queen', 12)
card_51 = Card.new(:spade, 'King', 13)
card_52 = Card.new(:spade, 'Ace', 14)

# create deck with all cards in it
# standard_deck = []
# 52.times do |i|
#   card_
#   standard_deck << "card_#{i += 1}".to_sym
# end
# p standard_deck
# This above method sort of works... looks like i may have to hard code
# for now...

standard_deck = [card_1, card_2, card_3, card_4, card_5, card_6, card_7,
  card_8, card_9, card_10, card_11, card_12, card_13, card_14, card_15,
  card_16, card_17, card_18, card_19, card_20, card_21, card_22, card_23,
  card_24, card_25, card_26, card_27, card_28, card_29, card_30, card_31,
  card_32, card_33, card_34, card_35, card_36, card_37, card_38, card_39,
  card_40, card_41, card_42, card_43, card_44, card_45, card_46, card_47,
  card_48, card_49, card_50, card_51, card_52]
# p standard_deck.count
# 52 elements!
# p standard_deck
# All cards accounted for
