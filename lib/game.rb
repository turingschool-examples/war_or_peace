require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


class Game
  attr_reader :player1, :player2, :turn_count

  def initialize(player1, player2)
    deck1 = Deck.new()
    @player1 = PLayer.new(player1_name, @deck1)
    @player2 = Player.new(player2_name, @deck2)
    @turn_count = 0
  end


end

def start
  turn = Turn.new(@player1, @player2)
  winner = turn.winner
  turn.pile_cards
  turn.award_spoils(winner)
  until @player1 == winner || @player2 == winner || turn_count == 1000000 do
    if turn = :basic
      puts 'Turn #{turn_count}: #{winner} won 2 cards'
    elsif turn = :war
      puts 'Turn #{turn_count}: WAR- #{winner} won 6 cards'
    elsif turn = :mutually_assured_destruction
      puts '*mutually assured destruction* 6 cards removed from play'
    else turn_count == 1000000
      puts '---- DRAW ----'
  end
  turn_count =+ 1

  end

  if player1.has_lost?
    puts '*~*~*~* #{winner.name} has won the game! *~*~*~*'
  else player2.has_lost?
    puts '*~*~*~* #{winner.name} has won the game! *~*~*~*'
  end

def playing_cards
  @full_deck = Deck.new

  card1 = (:heart, '2', 2)
  card2 = (:heart, '3', 3)
  card3 = (:heart, '4', 4)
  card4 = (:heart, '5', 5)
  card5 = (:heart, '6', 6)
  card6 = (:heart, '7', 7)
  card7 = (:heart, '8', 8)
  card8 = (:heart, '9', 9)
  card9 = (:heart, '10', 10)
  card10 = (:heart, 'Jack', 11)
  card11 = (:heart, 'Queen', 12)
  card12 = (:heart, 'King', 13)
  card13 = (:heart, 'Ace', 14)
  card14 = (:diamond, '2', 2)
  card15 = (:diamond, '3', 3)
  card16 = (:diamond, '4', 4)
  card17 = (:diamond, '5', 5)
  card18 = (:diamond, '6', 6)
  card19 = (:diamond, '7', 7)
  card20 = (:diamond, '8', 8)
  card21 = (:diamond, '9', 9)
  card22 = (:diamond, '10', 10)
  card23 = (:diamond, 'Jack', 11)
  card24 = (:diamond, 'Queen', 12)
  card26 = (:diamond, 'King', 13)
  card27 = (:diamond, 'Ace', 14)
  card28 = (:club, '2', 2)
  card29 = (:club, '3', 3)
  card30 = (:club, '4', 4)
  card31 = (:club, '5', 5)
  card32 = (:club, '6', 6)
  card33 = (:club, '7', 7)
  card34 = (:club, '8', 8)
  card35 = (:club, '9', 9)
  card36 = (:club, '10', 10)
  card37 = (:club, 'Jack', 11)
  card38 = (:club, 'Queen', 12)
  card39 = (:club, 'King', 13)
  card40 = (:club, 'Ace', 14)
  card41 = (:spade, '2', 2)
  card42 = (:spade, '3', 3)
  card43 = (:spade, '4', 4)
  card44 = (:spade, '5', 5)
  card45 = (:spade, '6', 6)
  card46 = (:spade, '7', 7)
  card47 = (:spade, '8', 8)
  card48 = (:spade, '9', 9)
  card49 = (:spade, '10', 10)
  card50 = (:spade, 'Jack', 11)
  card51 = (:spade, 'Queen', 12)
  card52 = (:spade, 'King', 13)
  card25 = (:spade, 'Ace', 14)

  full_deck = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52]
