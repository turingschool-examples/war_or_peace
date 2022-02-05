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



  # if player1.has_lost? || player2.has_lost?

  # else

    turn_count += 1
    turn.pile_cards
    # require 'pry'; binding.pry
    # break if turn_count > 1000000
    # break if player1.has_lost? || player2.has_lost?

    # if turn.type == :player1_loses || turn.type == :player2_loses
    #   require 'pry'; binding.pry
    #   puts "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
    # elsif turn.type == :draw || turn_count > 1000000
    #   puts "---- DRAW ----"


    if turn.type == :basic
      puts "Turn #{turn_count}: #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
    elsif turn.type == :war
      puts "Turn #{turn_count}: WAR - #{turn.winner.name} won #{turn.spoils_of_war.count} cards"
    elsif turn.type == :mutually_assured_destruction
      puts "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
    elsif turn.type == :player1_loses
      # player1.has_lost? == true
      player1.deck.cards.clear
      puts "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
    elsif turn.type == :player2_loses
      # player2.has_lost? == true
      player2.deck.cards.clear
      puts "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
    elsif turn.type == :draw || turn_count > 1000000
      puts "---- DRAW ----"
    end

    break if player1.has_lost? || player2.has_lost? || turn.type == :draw || turn_count > 1000000
    turn.award_spoils(turn.winner)
  end


# Error happens every once in a while

# Traceback (most recent call last):
#         4: from ./lib/war_or_peace_runner.rb:55:in `<main>'
#         3: from ./lib/war_or_peace_runner.rb:55:in `loop'
#         2: from ./lib/war_or_peace_runner.rb:67:in `block in <main>'
#         1: from /Users/andrewspeth/turing/1module/projects/war_or_peace/lib/turn.rb:12:in `type'
# /Users/andrewspeth/turing/1module/projects/war_or_peace/lib/deck.rb:9:in `rank_of_card_at': undefined method `rank' for nil:NilClass
# (NoMethodError)
