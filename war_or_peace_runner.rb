require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'

# create deck of cards
# cards = [
# card1 = Card.new(:Heart, '2', 2),
# card2 = Card.new(:Heart, '3', 3),
# card3 = Card.new(:Heart, '4', 4),
# card4 = Card.new(:Heart, '5', 5),
# card5 = Card.new(:Heart, '6', 6),
# card6 = Card.new(:Heart, '7', 7),
# card7 = Card.new(:Heart, '8', 8),
# card8 = Card.new(:Heart, '9', 9),
# card9 = Card.new(:Heart, '10', 10),
# card10 = Card.new(:Heart, 'Jack', 11),
# card11 = Card.new(:Heart, 'Queen', 12),
# card12 = Card.new(:Heart, 'King', 13),
# card13 = Card.new(:Heart, 'Ace', 14),
# card14 = Card.new(:diamond, '2', 2),
# card15 = Card.new(:diamond, '3', 3),
# card16 = Card.new(:diamond, '4', 4),
# card17 = Card.new(:diamond, '5', 5),
# card18 = Card.new(:diamond, '6', 6),
# card19 = Card.new(:diamond, '7', 7),
# card20 = Card.new(:diamond, '8', 8),
# card21 = Card.new(:diamond, '9', 9),
# card22 = Card.new(:diamond, '10', 10),
# card23 = Card.new(:diamond, 'Jack', 11),
# card24 = Card.new(:diamond, 'Queen', 12),
# card25 = Card.new(:diamond, 'King', 13),
# card26 = Card.new(:diamond, 'Ace', 14),
# card27 = Card.new(:spade, '2', 2),
# card28 = Card.new(:spade, '3', 3),
# card29 = Card.new(:spade, '4', 4),
# card30 = Card.new(:spade, '5', 5),
# card31 = Card.new(:spade, '6', 6),
# card32 = Card.new(:spade, '7', 7),
# card33 = Card.new(:spade, '8', 8),
# card34 = Card.new(:spade, '9', 9),
# card35 = Card.new(:spade, '10', 10),
# card36 = Card.new(:spade, 'Jack', 11),
# card37 = Card.new(:spade, 'Queen', 12),
# card38 = Card.new(:spade, 'King', 13),
# card39 = Card.new(:spade, 'Ace', 14),
# card40 = Card.new(:club, '2', 2),
# card41 = Card.new(:club, '3', 3),
# card42 = Card.new(:club, '4', 4),
# card43 = Card.new(:club, '5', 5),
# card44 = Card.new(:club, '6', 6),
# card45 = Card.new(:club, '7', 7),
# card46 = Card.new(:club, '8', 8),
# card47 = Card.new(:club, '9', 9),
# card48 = Card.new(:club, '10', 10),
# card49 = Card.new(:club, 'Jack', 11),
# card50 = Card.new(:club, 'Queen', 12),
# card51 = Card.new(:club, 'King', 13),
# card52 = Card.new(:club, 'Ace', 14)]

# shuffle deck and create 2 decks for
# each player
filename = "cards.txt"
cards = CardGenerator.new(filename).cards
cards = cards.shuffle
game_deck = Deck.new(cards)
deck1 = []
deck2 = []
26.times do
  deck1 << game_deck.cards[0]
  game_deck.remove_card
  deck2 << game_deck.cards[0]
  game_deck.remove_card
end

# create players 1 and 2
player_1_deck = Deck.new(deck1)
player_2_deck = Deck.new(deck2)
megan = Player.new("Megan", player_1_deck)
aurora = Player.new("Aurora", player_2_deck)
# terminal prompt. If user types GO
# game will be played
puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are Megan and Aurora."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"
ready_set = gets
ready_set = ready_set.chomp
if ready_set.upcase == "GO"
  game = Game.new(megan, aurora)
  game.start
else
  puts "you didn't enter GO"
end
