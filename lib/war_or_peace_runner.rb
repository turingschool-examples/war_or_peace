require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"

# Method notes:
# Cards: nada
# Decks: rank_of_card_at(array_loc) - specifies card at given index location
#        high_ranking_cards - returns an array with only the cards that are Jack+
#        percent_high_ranking - obvious
#        remove_card - removes first card of array
#        add_card(card_to_add) - adds specified card to end of array
# Players: has_lost? - if player has 0 cards, player loses (IMPORTANT!)
# Turns: type - determines round type
#        winner - determines round winner based on card values
#        pile_cards - removes the cards compared above and adds them to the spoils
#        award_spoils - moves cards from spoils to winner's deck, or destroys them
#        generate_cards - makes all of the cards (IMPORTANT)

p "Welcome to War!"

loop do
  print "Type 'GO' to start! >"
  x = gets.chomp.upcase

  if x == "GO"
    break
  end
end

p "What is your name, soldier? >"
y = gets.chomp.downcase.capitalize

deck1 = Deck.new([])
deck2 = Deck.new([])
player1 = Player.new(y, deck1)
player2 = Player.new("Mortimer", deck2)
turn = Turn.new(player1,player2)

turn.generate_cards

p "Welcome to the battle, #{y}! Your opponent is #{turn.player2.name} from the dastardly invading army!"

turn_count = 0

loop do
  turn_count += 1
  turn.type
  turn.winner
  turn.pile_cards
  turn.award_spoils
  if turn.type == ":basic"
    if turn.winner == "player1"
      p "Turn #{turn_count}: #{turn.player1.name} got 2 cards!"
    elsif turn.winner == "player2"
      p "Turn #{turn_count}: #{turn.player2.name} got 2 cards!"
    end
  elsif turn.type == ":war"
    if turn.winner == "player1"
      p "Turn #{turn_count}: #{turn.player1.name} got 6 cards!"
    elsif turn.winner == "player2"
      p "Turn #{turn_count}: #{turn.player2.name} got 6 cards!"
    end
  elsif turn.type == ":mutually_assured_destruction"
    p "Turn #{turn_count}: All cards wagered are now forfeit!"
  end
  turn.player1.has_lost?
  turn.player2.has_lost?

  if ((turn.player1.has_lost? == true) || (turn.player2.has_lost? == true)) || ((turn.player1.has_lost? == true) && (turn.player2.has_lost? == true)) || turn_count == 1000000
    break
  end
end

p "Thank you for playing!"
p "Your game lasted for #{turn_count} turns!"
p "Give yourself a pat on the back, #{turn.player1.name}!"
