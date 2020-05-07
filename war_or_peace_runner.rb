require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/play_war'

cards = []
suits = [:heart, :diamond, :spade, :club]
values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
rank_of_card = {2 => '2', 3 => '3', 4 =>'4', 5 =>'5', 6 =>'6', 7 =>'7', 8 =>'8', 9 =>'9', 10 =>'10', 11 =>'Jack', 12 =>'Queen', 13 =>'King', 14 =>'Ace'}


suits.each do |suit|
  values.each do |value|
    rank = rank_of_card.key(value)
    cards << Card.new(suit, value, rank)
  end
end

deck1 = []
26.times do
  single_card = cards[rand(cards.length)]
  deck1 << single_card
  cards.delete(single_card)
end

deck2 = cards

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

p "Welcome to War!(or Peace) This game will be played with 52 cards."
p "The players today are Megan and Aurora."
print "Type 'GO' to start the game!"
input = gets.chomp

play_war.start
