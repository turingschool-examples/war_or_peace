require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"

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

  if ((turn.player1.has_lost? == true) && (turn.player2.has_lost? == true))
    p "DRAW"
    break

  elsif turn.player2.has_lost? == true
    p "#{turn.player1.name} wins!"
    break

  elsif turn.player1.has_lost? == true
    p "#{turn.player2.name} wins!"
    break

  elsif turn_count == 1000000
    p "Turn count exceeded. War continues another day."
    break
  end
end

p "Thank you for playing!"
p "Your game lasted for #{turn_count} turns!"
p "Give yourself a pat on the back, #{turn.player1.name}!"
