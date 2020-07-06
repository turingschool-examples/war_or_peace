class Turn

  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type

    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      "No Winner"
    elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2))
      @player1
    elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2))
      @player2
    elsif (@player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0))
      @player1
    elsif (@player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0))
      @player2
    end
  end
  # p1firstcard = @player1.deck.rank_of_card_at(0)
  #look into case statements p1firstcard > p2firstcard

  def pile_cards
    if type == :mutually_assured_destruction || type == :war
      # @abyss << @player1.deck.cards[0] << @player1.deck.cards[1] << @player1.deck.cards[2] << @player2.deck.cards[0] << @player2.deck.cards[1] << @player2.deck.cards[2]
      @spoils_of_war = (@spoils_of_war << @player1.deck.cards.shift(3)).flatten
      @spoils_of_war = (@spoils_of_war << @player2.deck.cards.shift(3)).flatten

      # @player1.deck.cards.shift(3)
      # @player2.deck.cards.shift(3)
      #how to remove elements from array
    else
      # require "pry"; binding.pry
      @spoils_of_war = (@spoils_of_war << @player1.deck.cards.shift).flatten
      @spoils_of_war = (@spoils_of_war << @player2.deck.cards.shift).flatten
      # @player1.deck.cards.shift
      # @player2.deck.cards.shift
      # return @spoils_of_war
    end

  end

  def award_spoils(winner)
    # @player1.deck.cards.shift
    # @player2.deck.cards.shift
    # want spoils of war to be input into winner deck
    turn = Turn.new(@player1, @player2)
    winner = turn.winner
    winner.deck.cards << @spoils_of_war
  end

  def start
    turn = Turn.new(@player1, @player2)
    turn_number = 1
    if turn_number == 1000000
      puts "---- DRAW ----"
    elsif (turn_number < 1000000) && (@player1.deck.cards == [] || @player2.deck.cards == [])
      puts "*~*~*~* #{turn.winner} has won the game! *~*~*~*"
    else
      # turn_number = 1
      until ((turn_number == 1000000) || (@player1.deck.cards == [] || @player2.deck.cards == [])) do
        winner = turn.winner
        turn.pile_cards
        puts "Turn #{turn_number}: #{turn.winner} won #{turn.pile_cards.length} cards"
        turn.award_spoils(winner)
        turn_number += 1
      end
    end
  end



  # require "pry"; binding.pry

end
