require "./card"
require "./deck"
require "./player"
require "./turn"
require "./start_game"
require "./card_generator"
require "csv"

# spade1 = Card.new(:spade, "2", 2)
# spade2 = Card.new(:spade, "3", 3)
# spade3 = Card.new(:spade, "4", 4)
# spade4 = Card.new(:spade, "5", 5)
# spade5 = Card.new(:spade, "6", 6)
# spade6 = Card.new(:spade, "7", 7)
# spade7 = Card.new(:spade, "8", 8)
# spade8 = Card.new(:spade, "9", 9)
# spade9 = Card.new(:spade, "10", 10)
# spade10 = Card.new(:spade, "Jack", 11)
# spade11 = Card.new(:spade, "Queen", 12)
# spade12 = Card.new(:spade, "King", 13)
# spade13 = Card.new(:spade, "Ace", 14)
#
# spades = [spade1,spade2,spade3,spade4,spade5,spade6,spade7,spade8,spade9,spade10,spade11,spade12,spade13]
#
# heart1 = Card.new(:heart, "2", 2)
# heart2 = Card.new(:heart, "3", 3)
# heart3 = Card.new(:heart, "4", 4)
# heart4 = Card.new(:heart, "5", 5)
# heart5 = Card.new(:heart, "6", 6)
# heart6 = Card.new(:heart, "7", 7)
# heart7 = Card.new(:heart, "8", 8)
# heart8 = Card.new(:heart, "9", 9)
# heart9 = Card.new(:heart, "10", 10)
# heart10 = Card.new(:heart, "Jack", 11)
# heart11 = Card.new(:heart, "Queen", 12)
# heart12 = Card.new(:heart, "King", 13)
# heart13 = Card.new(:heart, "Ace", 14)
#
# hearts = [heart1,heart2,heart3,heart4,heart5,heart6,heart7,heart8,heart9,heart10,heart11,heart12,heart13]
#
# diamond1 = Card.new(:diamond, "2", 2)
# diamond2 = Card.new(:diamond, "3", 3)
# diamond3 = Card.new(:diamond, "4", 4)
# diamond4 = Card.new(:diamond, "5", 5)
# diamond5 = Card.new(:diamond, "6", 6)
# diamond6 = Card.new(:diamond, "7", 7)
# diamond7 = Card.new(:diamond, "8", 8)
# diamond8 = Card.new(:diamond, "9", 9)
# diamond9 = Card.new(:diamond, "10", 10)
# diamond10 = Card.new(:diamond, "Jack", 11)
# diamond11 = Card.new(:diamond, "Queen", 12)
# diamond12 = Card.new(:diamond, "King", 13)
# diamond13 = Card.new(:diamond, "Ace", 14)
#
# diamonds = [diamond1,diamond2,diamond3,diamond4,diamond5,diamond6,diamond7,diamond8,diamond9,diamond10,diamond11,diamond12,diamond13]
#
# club1 = Card.new(:club, "2", 2)
# club2 = Card.new(:club, "3", 3)
# club3 = Card.new(:club, "4", 4)
# club4 = Card.new(:club, "5", 5)
# club5 = Card.new(:club, "6", 6)
# club6 = Card.new(:club, "7", 7)
# club7 = Card.new(:club, "8", 8)
# club8 = Card.new(:club, "9", 9)
# club9 = Card.new(:club, "10", 10)
# club10 = Card.new(:club, "Jack", 11)
# club11 = Card.new(:club, "Queen", 12)
# club12 = Card.new(:club, "King", 13)
# club13 = Card.new(:club, "Ace", 14)
#
# clubs = [club1,club2,club3,club4,club5,club6,club7,club7,club8,club9,club10,club11,club12,club13]

# all_cards = []
# all_cards += spades
# all_cards += hearts
# all_cards += diamonds
# all_cards += clubs

generator = CardGenerator.new("./cards.txt")

all_cards = generator.cards

first_deck = all_cards.sample(26)
second_deck = all_cards - first_deck

deck1 = Deck.new(first_deck)
deck2 = Deck.new(second_deck)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

game = StartGame.new(player1, player2)

p "Welcome to War! (or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
p "Type 'Go' to start the game!"
p "------------------------------------------------------------------"

proceed = gets.chomp

if proceed == "GO"
  game.start
else
  p "Have a nice day!"
end
