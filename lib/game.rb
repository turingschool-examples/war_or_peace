require_relative 'turn'

class Game
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def play
    count = 0

    while winner.nil?
      count += 1
      turn = Turn.new(@player1, @player2)
      turn_type = turn.type
      turn_winner = turn.winner
      turn.pile_cards
      pile_size = turn.spoils_of_war.size
      print "Turn #{count}: #{display_details(turn_type, turn_winner, pile_size)}\n"
      turn.award_spoils(turn_winner, turn_type)
      print "#{@player1.name}_cards: #{@player1.deck.cards.size}\n"
      print "#{@player2.name}_cards: #{@player2.deck.cards.size}\n"
      break if count == 999_999
    end
    print "#{display_end_game(turn_winner)}\n"
  end

  def display_details(turn_type, turn_winner, pile_size)
    if turn_type == :mutually_assured_destruction
      "*mutually assured destruction* #{pile_size} cards removed from play"
    else
      "#{turn_type} - #{turn_winner.name} won #{pile_size} cards"
    end
  end

  def display_end_game(turn_winner)
    return "*~*~*~* it's a draw! *~*~*~*" if turn_winner.nil? || turn_winner == 'tie'

    "*~*~*~* #{turn_winner.name} has won the game! *~*~*~*"
  end

  def winner
    p1_deck = @player1.deck.cards.size
    p2_deck = @player1.deck.cards.size
    return 'tie' if p1_deck.zero? && p2_deck.zero?
    return @player2 if p1_deck.zero?
    return @player1 if p2_deck.zero?
  end
end
