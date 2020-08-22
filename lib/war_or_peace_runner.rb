require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


@full_deck_of_cards = []
suits = [:heart, :diamond, :spade, :club]

suits.select do |suit|
    value_map = {"2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10, "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14}
    value_map.select do |value, rank|
      card = Card.new(suit, value, rank)
      @full_deck_of_cards << card
  end
end

deck = Deck.new(@full_deck_of_cards.shuffle)

p deck

deck1 = []
deck2 =[]

deck.cards.each do |card|
  if deck1.length < 26
    deck1 << card
  else
    deck2 << card
  end
end

p deck1.length
p deck2.length

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)
