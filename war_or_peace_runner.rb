require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

l1 = "Welcome to War! (or Peace) This game will be played with 52 cards."
l2 = "The players today are #{"Megan"} and #{"Aurora"}."
l3 = "Type 'GO' to start the game!"

l1.length.times { print "-" }
puts
puts l1
puts l2
puts l3
l1.length.times { print "-" }
puts

loop do
  start = gets.chomp
  if start == "GO"
    Start.new.start
    break
  else
    p l3
  end
end

ranks = (1..13).to_a

values = (2..10).to_a
values = values.map do |value|
  value.to_s
end
values.prepend("Ace")

faces = ["Jack", "Queen", "King"]
faces.each do |face|
  values << face
end

suits = [:club, :spade, :heart, :diamond]

card_arr = []

suits.each do |suit|
  values.each_with_index do |value, i|
    card_arr << {"suit" => suit, "value" => value, "rank" => i+1}
  end
end

# Aces
p card_arr[0]
p card_arr[13]
p card_arr[26]
p card_arr[39]
