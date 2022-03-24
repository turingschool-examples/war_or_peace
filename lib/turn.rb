class Turn
  # require 'rspec'
  # require './lib/deck'
  # require './lib/card'
  # require '.lib/player'

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if player1.deck.cards[0].rank != player2.deck.cards[0].rank
      # require 'pry'; binding.pry
      return :basic
    elsif (player1.deck.cards[0].rank == player2.deck.cards[0].rank) && (player1.deck.cards[2].rank == player2.deck.cards[2].rank)
      return :mutually_assured_destruction
    else
      return :war
    end
  end

  def winner
    # require 'pry'; binding.pry
    turn_type = type

    if turn_type == :basic
      if player1.deck.cards[0].rank > player2.deck.cards[0].rank
        return player1
      else
        return player2
      end
    elsif turn_type == :war
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        return player1
      else
        return player2
      end
    else
      return "No Winner"
    end

  end

  def pile_cards
    turn_type = type
    turn_winner = winner

    if turn_type == :basic
      # require 'pry'; binding.pry
      spoils_of_war.push(player1.deck.cards.shift)
      spoils_of_war.push(player2.deck.cards.shift)
      # require 'pry'; binding.pry
    elsif turn_type == :war
      # require 'pry'; binding.pry
      3.times do
        spoils_of_war.push(player1.deck.cards.shift)
      end
      3.times do
        spoils_of_war.push(player2.deck.cards.shift)
      end
      # require 'pry'; binding.pry
    else
      3.times do
        player1.deck.cards.shift
      end
      3.times do
        player2.deck.cards.shift
      end
    end
  end

  def award_spoils(turn_winner)
     # awarded_spoils = spoils_of_war
     # turn_winner = winner

     require 'pry'; binding.pry

    if turn_winner == player1

      spoils_of_war.each do |spoil_card|

        player1.deck.cards.push(spoil_card)
      end

    elsif turn_winner == player2

      spoils_of_war.each do |spoil_card|

        player2.deck.cards.push(spoil_card)
        # require 'pry'; binding.pry
      end
    else

    end


  end

end
