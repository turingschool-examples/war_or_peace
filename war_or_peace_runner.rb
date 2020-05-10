require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

@l1 = "Welcome to War! (or Peace) This game will be played with 52 cards."
l2 = "The players today are #{"Megan"} and #{"Aurora"}."
l3 = "Type 'GO' to start the game!"

def dashes
  @l1.length.times { print "-" }
  puts
end

dashes
puts @l1
puts l2
puts l3
dashes

values = (2..10).to_a
values = values.map do |value|
  value.to_s
end

faces = ["Jack", "Queen", "King", "Ace"]
faces.each do |face|
  values << face
end

suits = [:club, :spade, :heart, :diamond]

proto_arr = []

suits.each do |suit|
  values.each_with_index do |value, i|
    proto_arr << {"suit" => suit, "value" => value, "rank" => i+1}
  end
end

card_arr = []

proto_arr.length.times do |i|
  card_arr << Card.new(proto_arr[i]["suit"], proto_arr[i]["value"], proto_arr[i]["rank"])
end

# 3.times { card_arr.shuffle! }

# both decks in same order 1-13, 1-13
deck1 = Deck.new(card_arr[0..25])
deck2 = Deck.new(card_arr[26..51])

# deck1 = Deck.new(card_arr[0..12])
# deck2 = Deck.new(card_arr[13..25])


# p deck1.cards.size == deck2.cards.size

p1 = Player.new("Megan", deck1)
p2 = Player.new("Aurora", deck2)

turn = Turn.new(p1, p2)

start = Start.new(turn)

start.play


#
# loop do
#   start = gets.chomp
#   if start == "GO"
#     turn.start
#     break
#   else
#     p l3
#   end
# end
