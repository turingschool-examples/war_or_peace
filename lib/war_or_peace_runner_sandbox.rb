require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/card_generator'
require 'CSV'



require 'pry'; binding.pry

card1 = Card.new(:heart, 'Ace', 14)
card2 = Card.new(:heart, '2', 2)
card3 = Card.new(:heart, '3', 3)
card4 = Card.new(:heart, '4', 4)
card5 = Card.new(:heart, '5', 5)
card6 = Card.new(:heart, '6', 6)
card7 = Card.new(:heart, '7', 7)
card8 = Card.new(:heart, '8', 8)
card9 = Card.new(:heart, '9', 9)
card10 = Card.new(:heart, '10', 10)
card11 = Card.new(:heart, 'Jack', 11)
card12 = Card.new(:heart, 'Queen', 12)
card13 = Card.new(:heart, 'King', 13)

card14 = Card.new(:spade, 'Ace', 14)
card15 = Card.new(:spade, '2', 2)
card16 = Card.new(:spade, '3', 3)
card17 = Card.new(:spade, '4', 4)
card18 = Card.new(:spade, '5', 5)
card19 = Card.new(:spade, '6', 6)
card20 = Card.new(:spade, '7', 7)
card21 = Card.new(:spade, '8', 8)
card22 = Card.new(:spade, '9', 9)
card23 = Card.new(:spade, '10', 10)
card24 = Card.new(:spade, 'Jack', 11)
card25 = Card.new(:spade, 'Queen', 12)
card26 = Card.new(:spade, 'King', 13)

card27 = Card.new(:club, 'Ace', 14)
card28 = Card.new(:club, '2', 2)
card29 = Card.new(:club, '3', 3)
card30 = Card.new(:club, '4', 4)
card31 = Card.new(:club, '5', 5)
card32 = Card.new(:club, '6', 6)
card33 = Card.new(:club, '7', 7)
card34 = Card.new(:club, '8', 8)
card35 = Card.new(:club, '9', 9)
card36 = Card.new(:club, '10', 10)
card37 = Card.new(:club, 'Jack', 11)
card38 = Card.new(:club, 'Queen', 12)
card39 = Card.new(:club, 'King', 13)

card40 = Card.new(:diamond, 'Ace', 14)
card41 = Card.new(:diamond, '2', 2)
card42 = Card.new(:diamond, '3', 3)
card43 = Card.new(:diamond, '4', 4)
card44 = Card.new(:diamond, '5', 5)
card45 = Card.new(:diamond, '6', 6)
card46 = Card.new(:diamond, '7', 7)
card47 = Card.new(:diamond, '8', 8)
card48 = Card.new(:diamond, '9', 9)
card49 = Card.new(:diamond, '10', 10)
card50 = Card.new(:diamond, 'Jack', 11)
card51 = Card.new(:diamond, 'Queen', 12)
card52 = Card.new(:diamond, 'King', 13)

deck1 = Deck.new([])
deck2 = Deck.new([])

# filename = "cards.txt"

# generator = CardGenerator.new(filename)
# complete_deck = generator.generate_cards

require 'pry'; binding.pry

complete_deck = Deck.new([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52])
require 'pry'; binding.pry
shuffled_deck = Deck.new(complete_deck.cards.shuffle)
# shuffled_deck = complete_deck
require 'pry'; binding.pry

deck_counter = shuffled_deck.cards.count / 2

require 'pry'; binding.pry

deck_counter.times do
  deck1.cards.push(shuffled_deck.cards.shift)
  deck2.cards.push(shuffled_deck.cards.shift)
end


require 'pry'; binding.pry


# p "Enter player 1 Name:"
player_1_name = "Megan"
#
# p "Enter player 1 Name:"
player_2_name = "Aurora"

player1 = Player.new(player_1_name, deck1)
player2 = Player.new(player_2_name, deck2)

new_game = Game.new(player1, player2)

require 'pry'; binding.pry

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are #{player_1_name} and #{player_2_name}."

# require 'pry'; binding.pry

p "Type 'Go' to start the game!"

starter_input = gets.chomp

if starter_input != 'Go'
  p "Invalid Input"

else
  while new_game.game_over == false
    # require 'pry'; binding.pry
    p new_game.start
    # require 'pry'; binding.pry


  end

# require 'pry'; binding.pry
end
