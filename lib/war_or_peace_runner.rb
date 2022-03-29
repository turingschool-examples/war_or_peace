require './turn'

dealer_deck = Deck.new([
  Card.new(:heart, '2', 2),
  Card.new(:heart, '3', 3),
  Card.new(:heart, '4', 4),
  Card.new(:heart, '5', 5),
  Card.new(:heart, '6', 6),
  Card.new(:heart, '7', 7),
  Card.new(:heart, '8', 8),
  Card.new(:heart, '9', 9),
  Card.new(:heart, '10', 10),
  Card.new(:heart, 'Jack', 11),
  Card.new(:heart, 'Queen', 12),
  Card.new(:heart, 'King', 13),
  Card.new(:heart, 'Ace', 14),
  Card.new(:spade, '2', 2),
  Card.new(:spade, '3', 3),
  Card.new(:spade, '4', 4),
  Card.new(:spade, '5', 5),
  Card.new(:spade, '6', 6),
  Card.new(:spade, '7', 7),
  Card.new(:spade, '8', 8),
  Card.new(:spade, '9', 9),
  Card.new(:spade, '10', 10),
  Card.new(:spade, 'Jack', 11),
  Card.new(:spade, 'Queen', 12),
  Card.new(:spade, 'King', 13),
  Card.new(:spade, 'Ace', 14),
  Card.new(:diamond, '2', 2),
  Card.new(:diamond, '3', 3),
  Card.new(:diamond, '4', 4),
  Card.new(:diamond, '5', 5),
  Card.new(:diamond, '6', 6),
  Card.new(:diamond, '7', 7),
  Card.new(:diamond, '8', 8),
  Card.new(:diamond, '9', 9),
  Card.new(:diamond, '10', 10),
  Card.new(:diamond, 'Jack', 11),
  Card.new(:diamond, 'Queen', 12),
  Card.new(:diamond, 'King', 13),
  Card.new(:diamond, 'Ace', 14),
  Card.new(:clubs, '2', 2),
  Card.new(:clubs, '3', 3),
  Card.new(:clubs, '4', 4),
  Card.new(:clubs, '5', 5),
  Card.new(:clubs, '6', 6),
  Card.new(:clubs, '7', 7),
  Card.new(:clubs, '8', 8),
  Card.new(:clubs, '9', 9),
  Card.new(:clubs, '10', 10),
  Card.new(:clubs, 'Jack', 11),
  Card.new(:clubs, 'Queen', 12),
  Card.new(:clubs, 'King', 13),
  Card.new(:clubs, 'Ace', 14)
])

#shuffled
shuffled_deck = []

dealer_deck.cards.each_with_index do |value, index|
  pos = Random.new.rand(0..51)
  x = dealer_deck.cards[index]
  y = dealer_deck.cards[pos]
  dealer_deck.cards[pos] = x
  dealer_deck.cards[index] = y
  shuffled_deck = dealer_deck
end

#deal
deck1 = Deck.new([])
deck2 = Deck.new([])

shuffled_deck.cards.each_with_index do |value, index|
  if index%2 == 0 #% = modulus (gets the remainder)
    deck1.cards << value
  else
    deck2.cards << value
  end
end

puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are Megan and Aurora."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

turns = 1

 while turns < 1000001

  if player1.deck.cards.length == 52
    puts "#{player1.name} Won"
    break
  elsif player2.deck.cards.length == 52
    puts "#{player2.name} Won"
    break
  else # play game


  turn = Turn.new(player1, player2)
  type = turn.type
  turn.pile_of_cards
  winner = turn.winner
  turn.pile_of_cards
  turn.award_spoils(winner)

  if type == :basic
    puts "Turn#{turns}: #{winner.name} won 2 cards"
  elsif type == :mutually_assured_destruction
    puts "Turn#{turns}: *mutually assured destruction* 6 cards removed from play"
  else

    puts "Turn#{turns}: #{winner.name} won 6 cards"
  end

  turns += 1
  end
 end
