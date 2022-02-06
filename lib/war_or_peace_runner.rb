require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

cards_value_rank = {
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "10" => 10,
  "Jack" => 11,
  "Queen" => 12,
  "King" => 13,
  "Ace" => 14
}

suits = [:heart, :diamond, :spade, :club]

cards = []

suits.each do |suit|
  cards_value_rank.each do |value, rank|
    card = Card.new(suit, value, rank)
    cards << card
  end
end

cards.shuffle!
deck1 = Deck.new(cards[0..25])
deck2 = Deck.new(cards[26..51])

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

turn = Turn.new(player1, player2)

turn.start

if turn.input.upcase == "GO"
  p "Time to go to War (or Peace)!"
else
  loop do
    p "Invalid input - type 'GO' to start the game!"
    input = gets.chomp
    break if input == "GO"
  end
end

turn_count = 0

loop do
  turn_count += 1
  turn.pile_cards

  if turn.type == :basic
    puts "Turn #{turn_count}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
  elsif turn.type == :war
    puts "Turn #{turn_count}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
  elsif turn.type == :mutually_assured_destruction
    puts "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
  elsif turn.type == :player1_loses
    player1.deck.cards.clear
    puts "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
  elsif turn.type == :player2_loses
    player2.deck.cards.clear
    puts "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
  elsif turn.type == :draw || turn_count > 1000000
    puts "---- DRAW ----"
  end

  break if player1.has_lost? || player2.has_lost? || turn.type == :draw || turn_count > 1000000
  turn.award_spoils(turn.winner)
end
