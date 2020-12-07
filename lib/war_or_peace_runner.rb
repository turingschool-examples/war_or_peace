require '../lib/card'
require '../lib/deck'
require '../lib/player'
require '../lib/turn'
require '../lib/start'

text = <<HEREDOC
Welcome to War! (or Peace) This game will be played with 52 cards.
The players today are Megan and Aurora.
Type 'GO' to start the game!
------------------------------------------------------------------
HEREDOC

puts text

full_deck = []

13.times do |num|
  num = num + 2
  if num < 11
    full_deck << Card.new(:spade, num.to_s, num)
    full_deck << Card.new(:club, num.to_s, num)
    full_deck << Card.new(:heart, num.to_s, num)
    full_deck << Card.new(:diamond, num.to_s, num)
  elsif num == 11
    full_deck << Card.new(:spade, 'Jack', num)
    full_deck << Card.new(:club, 'Jack', num)
    full_deck << Card.new(:heart, 'Jack', num)
    full_deck << Card.new(:diamond, 'Jack', num)
  elsif num == 12
    full_deck << Card.new(:spade, 'Queen', num)
    full_deck << Card.new(:club, 'Queen', num)
    full_deck << Card.new(:heart, 'Queen', num)
    full_deck << Card.new(:diamond, 'Queen', num)
  elsif num == 13
    full_deck << Card.new(:spade, 'King', num)
    full_deck << Card.new(:club, 'King', num)
    full_deck << Card.new(:heart, 'King', num)
    full_deck << Card.new(:diamond, 'King', num)
  else
    full_deck << Card.new(:spade, 'Ace', num)
    full_deck << Card.new(:club, 'Ace', num)
    full_deck << Card.new(:heart, 'Ace', num)
    full_deck << Card.new(:diamond, 'Ace', num)
  end
end

full_deck = full_deck.sample(52)

deck1 = Deck.new(full_deck[0..25])
deck2 = Deck.new(full_deck[26..51])

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

turn = Turn.new(player1, player2)

input = gets.chomp

if input == "GO"
  start = Start.new(turn)
  start.start
end
