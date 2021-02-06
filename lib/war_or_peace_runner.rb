require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


box_cards = [@card1, @card2, @card3, @card4, @card5, @card6, @card7, @card8, @card9, @card10, @card11, @card12, @card13, @card14, @card15, @card16, @card17, @card18, @card19, @card20, @card21, @card22, @card23, @card24, @card25, @card26, @card27, @card28, @card29, @card30, @card31, @card32, @card33, @card34, @card35, @card36, @card37, @card38, @card39, @card40, @card41, @card42, @card43, @card44, @card45, @card46, @card47, @card48, @card49, @card50, @card51, @card52]

shuffled_deck = box_cards.shuffle

deck1 = Deck.new(shuffled_deck.take 26)
deck2 = Deck.new(shuffled_deck.drop 26)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)


p "Weclome to War! (or Peace) This game will be played with 52 cards. The players today are #{player1.name} and #{player2.name}. Type 'GO' to start the game!"
puts '--' * 30

go = $stdin.gets.upcase.chomp

if go == "GO"
  i = 1
  until player1.has_lost? == true || player2.has_lost? == true || i == 10000 do
    turn = Turn.new(player1, player2)
    winner_of_turn = turn.winner
    type_of_turn = turn.turn_type
    turn.pile_cards
    case type_of_turn
    when :war
      turn.awards_spoils(winner_of_turn)
      p "WAR - #{winner_of_turn.name} won 6 cards --#{player1.deck.cards.length} --#{player2.deck.cards.length}"

    when :basic
      turn.awards_spoils(winner_of_turn)
      p "Turn #{i}: #{winner_of_turn.name} won 2 cards --#{player1.deck.cards.length} --#{player2.deck.cards.length}"

    when :mutually_assured_destruction
      p "*mutually assured destruction* 6 cards removed from play"
    end
    # require "pry"; binding.pry
    i += 1
  end
  if player1.has_lost?
    p "*~*~*~* #{player2.name} has won the game! *~*~*~*"
  else
    p "*~*~*~* #{player1.name} has won the game! *~*~*~*"
  end
else
  p "What Game Do You Want!?"
end
