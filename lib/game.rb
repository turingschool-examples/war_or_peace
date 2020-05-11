require "./lib/card"
require "./lib/deck"
require "./lib/player"
require "./lib/turn"

class Game
  def initialize(player1, player2)
    @first_player = player1
    @second_player = player2
    @count = 0
  end

  def start
    cards = []
    rank = 1
    array_of_values = (Array.new(11) {|integer| integer.to_s} +
                      ["Jack", "Queen", "King", "Ace"])
    array_of_values.shift(2)
    value = array_of_values
    num = -1

    13.times do
      card = Card.new(:club, value[num += 1], rank += 1 )
      cards << card
    end
    rank = 1
    num = -1
    13.times do
      card = Card.new(:spade, value[num += 1], rank += 1 )
      cards << card
    end
    rank = 1
    num = -1
    13.times do
      card = Card.new(:heart, value[num += 1], rank += 1 )
      cards << card
    end
    rank = 1
    num = -1
    13.times do
      card = Card.new(:diamond, value[num += 1], rank += 1 )
      cards << card
    end

    left,right = cards.shuffle.each_slice( (cards.size/2.0).round ).to_a

    deck1 = Deck.new(left)
    deck2 = Deck.new(right)

    player1 = Player.new(@first_player, deck1)
    player2 = Player.new(@second_player, deck2)

    turn = Turn.new(player1, player2)

    while !player1.has_lost? && !player2.has_lost? && @count < 1000000
      @count += 1
      case turn.type
        when :basic
          winner = turn.winner
          p "Turn #{@count}:#{winner.name} won 2 cards"
          turn.pile_cards
          turn.award_spoils(winner)
        when :war
          winner = turn.winner
          p "Turn #{@count}:WAR - #{winner.name} won 6 cards"
          turn.pile_cards
          turn.award_spoils(winner)
        else
          require "pry"
          binding.pry
          turn.pile_cards
          p "Turn #{@count}:*mutually assured destruction* 6 removed from play"
      end
    end
      if @count >= 1000000
        p "-------------- DRAW ---------------"
      else
        p "*~*~*~* #{winner.name} has won the game! *~*~*~*"
      end
  end
end
