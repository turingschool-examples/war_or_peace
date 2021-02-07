require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/lets_play_cards'
require './lib/card_generator'

#Create 52 cards
# @box_cards = [@card1, @card2, @card3, @card4, @card5, @card6, @card7, @card8, @card9, @card10, @card11, @card12, @card13, @card14, @card15, @card16, @card17, @card18, @card19, @card20, @card21, @card22, @card23, @card24, @card25, @card26, @card27, @card28, @card29, @card30, @card31, @card32, @card33, @card34, @card35, @card36, @card37, @card38, @card39, @card40, @card41, @card42, @card43, @card44, @card45, @card46, @card47, @card48, @card49, @card50, @card51, @card52]

#Put those cards into two decks(randomness!)
# shuffled_deck = @box_cards.shuffle


#ITERATION 4
# Pull cards from cards.txt
#create variable equal to the cards.txt file
file = File.new('cards.txt')
# Use File class method to input data
lines = File.readlines(file, chomp: true)
# Use card generator to create an aray of 52 cards
full_deck = CardGenerator.new(lines)
# create variable to represent the imported card data and shuffle
shuffled_deck = full_deck.cards.shuffle


deck1 = Deck.new(shuffled_deck.take 26)
deck2 = Deck.new(shuffled_deck.drop 26)

#Create two players with the Decks you created.
player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

#Start the game using a new method called start.
turn = Turn.new(player1, player2)
war = War.new(turn)
war.start
