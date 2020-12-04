require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'
require '../lib/start'

# text = <<HEREDOC
# Welcome to War! (or Peace) This game will be played with 52 cards.
# The players today are Megan and Aurora.
# Type 'GO' to start the game!
# ------------------------------------------------------------------
# HEREDOC
#
# puts text

full_deck = []

13.times do |num|
  num = num + 2
  if num < 11
    full_deck << [:spade, num.to_s, num]
  elsif num == 11
    full_deck << [:spade, 'Jack', num]
  elsif num == 12
    full_deck << [:spade, 'Queen', num]
  elsif num == 13
    full_deck << [:spade, 'King', num]
  else
    full_deck << [:spade, 'Ace', num]
  end
end

13.times do |num|
  num = num + 2
  if num < 11
    full_deck << [:club, num.to_s, num]
  elsif num == 11
    full_deck << [:club, 'Jack', num]
  elsif num == 12
    full_deck << [:club, 'Queen', num]
  elsif num == 13
    full_deck << [:club, 'King', num]
  else
    full_deck << [:club, 'Ace', num]
  end
end

13.times do |num|
  num = num + 2
  if num < 11
    full_deck << [:heart, num.to_s, num]
  elsif num == 11
    full_deck << [:heart, 'Jack', num]
  elsif num == 12
    full_deck << [:heart, 'Queen', num]
  elsif num == 13
    full_deck << [:heart, 'King', num]
  else
    full_deck << [:heart, 'Ace', num]
  end
end

13.times do |num|
  num = num + 2
  if num < 11
    full_deck << [:diamond, num.to_s, num]
  elsif num == 11
    full_deck << [:diamond, 'Jack', num]
  elsif num == 12
    full_deck << [:diamond, 'Queen', num]
  elsif num == 13
    full_deck << [:diamond, 'King', num]
  else
    full_deck << [:diamond, 'Ace', num]
  end
end

full_deck.sample(52)

deck1 = full_deck[0..25]
deck2 = full_deck[26..51]




#results in war
# card1 = Card.new(:heart, 'Jack', 11)
# card2 = Card.new(:heart, '10', 10)
# card3 = Card.new(:heart, '9', 9)
# card4 = Card.new(:diamond, 'Jack', 11)
# card5 = Card.new(:heart, '8', 8)
# card6 = Card.new(:diamond, 'Queen', 12)
# card7 = Card.new(:heart, '3', 3)
# card8 = Card.new(:diamond, '2', 2)

#results in mad
# card1 = Card.new(:heart, 'Jack', 11)
# card2 = Card.new(:heart, '10', 10)
# card3 = Card.new(:heart, '9', 9)
# card4 = Card.new(:diamond, 'Jack', 11)
# card5 = Card.new(:heart, '8', 8)
# card6 = Card.new(:diamond, '8', 8)
# card7 = Card.new(:heart, '3', 3)
# card8 = Card.new(:diamond, '2', 2)
#
# deck1 = Deck.new([card1, card2, card5, card8])
# deck2 = Deck.new([card4, card3, card6, card7])
#
# player1 = Player.new("Megan", deck1)
# player2 = Player.new("Aurora", deck2)
#
# turn = Turn.new(player1, player2)

# input = gets.chomp
#
# if input == "GO"
#   start = Start.new(turn)
# end
#
# start.start
