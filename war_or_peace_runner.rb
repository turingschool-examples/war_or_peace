require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
# require './util/build'
require './lib/start'
require './lib/card_generator'


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

# proto_arr = Build.new.proto_arr
# card_arr = []
#
# proto_arr.length.times do |i|
#   card_arr << Card.new(proto_arr[i]["suit"], proto_arr[i]["value"], proto_arr[i]["rank"])
# end

card_arr = CardGenerator.new("cards.txt").cards

card_arr.shuffle!

deck1 = Deck.new(card_arr[0..25])
deck2 = Deck.new(card_arr[26..51])

p1 = Player.new("Megan", deck1)
p2 = Player.new("Aurora", deck2)

turn = Turn.new(p1, p2)

loop do
  start = gets.chomp
  if start == "GO"
    Start.new(turn)
    break
  else
    p l3
  end
end
