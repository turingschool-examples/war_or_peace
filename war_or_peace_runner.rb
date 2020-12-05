require './lib/deck'
require './lib/player'
require './lib/card'
require './lib/turn'
require './lib/game'
require 'pry'

#deck set up
standard_deck = []
suits = [:club, :diamond, :heart, :spade]

suits.map do |suit|
  (2..14).each do |card|
    if card > 1 && card < 11
      standard_deck << Card.new(suit, "#{card}", card)
    elsif card == 11
      standard_deck << Card.new(suit, 'Jack', card)
    elsif card == 12
      standard_deck << Card.new(suit, 'Queen', card)
    elsif card == 13
      standard_deck << Card.new(suit, 'King', card)
    elsif card == 14
      standard_deck << Card.new(suit, 'Ace', card)
    end
  end
end

shuffle_deck = standard_deck.shuffle
cards1 = []
cards2 = []
shuffle_deck.each_with_index do |card, index|
  if index < 26
    cards1 << card
  else
    cards2 << card
  end
end

deck1 = Deck.new(cards1)
#<Deck:0x00007fea0a1d53c0
 # @cards=
  [#<Card:0x00007fea0a1def38 @rank=2, @suit=:club, @value="2">,
   #<Card:0x00007fea0a1d7080 @rank=8, @suit=:heart, @value="8">,
   #<Card:0x00007fea0a1de308 @rank=9, @suit=:club, @value="9">,
   #<Card:0x00007fea0a1ded08 @rank=4, @suit=:club, @value="4">,
   #<Card:0x00007fea0a1d5a78 @rank=11, @suit=:spade, @value="Jack">,
   #<Card:0x00007fea0a1d74e0 @rank=2, @suit=:heart, @value="2">,
   #<Card:0x00007fea0a1d7210 @rank=6, @suit=:heart, @value="6">,
   #<Card:0x00007fea0a1d66f8 @rank=4, @suit=:spade, @value="4">,
   #<Card:0x00007fea0a1dd688 @rank=7, @suit=:diamond, @value="7">,
   #<Card:0x00007fea0a1dcb20 @rank=12, @suit=:diamond, @value="Queen">,
   #<Card:0x00007fea0a1dccd8 @rank=11, @suit=:diamond, @value="Jack">,
   #<Card:0x00007fea0a1dcfd0 @rank=9, @suit=:diamond, @value="9">,
   #<Card:0x00007fea0a1de268 @rank=10, @suit=:club, @value="10">,
   #<Card:0x00007fea0a1de038 @rank=2, @suit=:diamond, @value="2">,
   #<Card:0x00007fea0a1d6978 @rank=2, @suit=:spade, @value="2">,
   #<Card:0x00007fea0a1ddb38 @rank=4, @suit=:diamond, @value="4">,
   #<Card:0x00007fea0a1d57a8 @rank=12, @suit=:spade, @value="Queen">,
   #<Card:0x00007fea0a1de948 @rank=8, @suit=:club, @value="8">,
   #<Card:0x00007fea0a1d7350 @rank=4, @suit=:heart, @value="4">,
   #<Card:0x00007fea0a1dd1d8 @rank=8, @suit=:diamond, @value="8">,
   #<Card:0x00007fea0a1de9e8 @rank=7, @suit=:club, @value="7">,
   #<Card:0x00007fea0a1d6db0 @rank=12, @suit=:heart, @value="Queen">,
   #<Card:0x00007fea0a1dead8 @rank=6, @suit=:club, @value="6">,
   #<Card:0x00007fea0a1dec90 @rank=5, @suit=:club, @value="5">,
   #<Card:0x00007fea0a1dd890 @rank=6, @suit=:diamond, @value="6">,
   #<Card:0x00007fea0a1de150 @rank=13, @suit=:club, @value="King">]>

deck2 = Deck.new(cards2)
#<Deck:0x00007fea0a1d5398
 # @cards=
  [#<Card:0x00007fea0a1d6ef0 @rank=10, @suit=:heart, @value="10">,
   #<Card:0x00007fea0a1de1c8 @rank=12, @suit=:club, @value="Queen">,
   #<Card:0x00007fea0a1d6220 @rank=9, @suit=:spade, @value="9">,
   #<Card:0x00007fea0a1d6d38 @rank=13, @suit=:heart, @value="King">,
   #<Card:0x00007fea0a1d5d70 @rank=10, @suit=:spade, @value="10">,
   #<Card:0x00007fea0a1df7f8 @rank=14, @suit=:diamond, @value="Ace">,
   #<Card:0x00007fea0a1d6630 @rank=5, @suit=:spade, @value="5">,
   #<Card:0x00007fea0a1d6a68 @rank=14, @suit=:heart, @value="Ace">,
   #<Card:0x00007fea0a1d6400 @rank=8, @suit=:spade, @value="8">,
   #<Card:0x00007fea0a1d7120 @rank=7, @suit=:heart, @value="7">,
   #<Card:0x00007fea0a1ded80 @rank=3, @suit=:club, @value="3">,
   #<Card:0x00007fea0a1dce18 @rank=10, @suit=:diamond, @value="10">,
   #<Card:0x00007fea0a1de218 @rank=11, @suit=:club, @value="Jack">,
   #<Card:0x00007fea0a1dd9d0 @rank=5, @suit=:diamond, @value="5">,
   #<Card:0x00007fea0a1d5708 @rank=13, @suit=:spade, @value="King">,
   #<Card:0x00007fea0a1d72d8 @rank=5, @suit=:heart, @value="5">,
   #<Card:0x00007fea0a1d6810 @rank=3, @suit=:spade, @value="3">,
   #<Card:0x00007fea0a1d6f68 @rank=9, @suit=:heart, @value="9">,
   #<Card:0x00007fea0a1d64f0 @rank=7, @suit=:spade, @value="7">,
   #<Card:0x00007fea0a1d5640 @rank=14, @suit=:spade, @value="Ace">,
   #<Card:0x00007fea0a1d73f0 @rank=3, @suit=:heart, @value="3">,
   #<Card:0x00007fea0a1de100 @rank=14, @suit=:club, @value="Ace">,
   #<Card:0x00007fea0a1df4b0 @rank=13, @suit=:diamond, @value="King">,
   #<Card:0x00007fea0a1ddfc0 @rank=3, @suit=:diamond, @value="3">,
   #<Card:0x00007fea0a1d6ea0 @rank=11, @suit=:heart, @value="Jack">,
   #<Card:0x00007fea0a1d6590 @rank=6, @suit=:spade, @value="6">]>

binding.pry

#Player set up
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
#Game set up
turn = Turn.new(player1, player2)
game = Game.new(turn)
#

game.welcome
type = turn.type



#GAME PLAY

  if turn.player1.deck.cards  == [] && turn.player2.deck.cards == []
    p "This is mathmatically near impossible, you have accomplished something rare! It is impressive, but everyone LOSES."
  elsif turn.player1.deck.cards  == []
    p "*~*~*~* Aurora has won the game! *~*~*~*"
  elsif turn.player2.deck.cards == []
    p "*~*~*~* Megan has won the game! *~*~*~*"
  elsif
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.type
    p turn.pile_cards
    turn.award_spoils(winner)
  end






























# game.each do |turn|
#   turn.turn.winner = winner
#   turn.turn.pile_cards
#   turn.turn.award_spoils
# end
