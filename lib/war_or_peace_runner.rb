require './card.rb'
require './deck.rb'
require './player.rb'
require './turn.rb'

# sorry about the mess

# create 52 cards

full_deck_of_cards = []
suits = ["spade", "diamond", "heart", "club"]
#value = [:2, :3, :4, :5, :6, :7, :8, :9, :10, :jack, :queen, :king, :ace]
value = [':2', ':3', ':4', ':5', ':6', ':7', ':8', ':9', ':10', ':jack', ':queen', ':king', ':ace']
rank = 2

suits.each do |suit|
  value.each do |value|
    card = Card.new(suit, value, rank)
    rank += 1
    full_deck_of_cards << card
  end
end


# shuffle cards and divide them equally into two decks

full_deck_of_cards.shuffle!

half_deck_of_cards1 = full_deck_of_cards[0..25]
half_deck_of_cards2 = full_deck_of_cards[26..51]

deck1 = Deck.new(half_deck_of_cards1)
deck2 = Deck.new(half_deck_of_cards2)

# create two players with the Decks you created

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)



#start the game using a new method called start
#THIS METHOD WILL NEED TO BE INCLUDED IN A CLASS - IT IS UP TO YOU WHICH CLASS
#EITHER IN EXISTING OR A NEW CLASS


def game

  p "Welcome to War! (or Peace) This game will be played with 52 cards."
  p "The players today are Megan and Aurora."
  p "Type 'GO' to start the game!"

  answer = gets.chomp

  if answer.upcase == "GO"


  elsif answer.upcase != "GO"

    p "Too bad! Maybe next time!"

  end

end

require 'pry'; binding.pry
