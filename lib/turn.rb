#'./lib/turn.rb'
require './lib/card'
require './lib/deck'
require './lib/player'


class Turn

  attr_reader :player1, :player2
  def initialize (player1, player2)

    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end

  def type

    player1_card = @player1.deck.rank_of_card_at(0)
    player2_card = @player2.deck.rank_of_card_at(0)

    if player1_card != player2_card
        puts "basic type"
        return :basic

    elsif (player1_card == player2_card) &&
          (@player1.rank_of_card_at(2) == @player2.rank_of_card_at(2))
        puts "mutually_assured_destruction type"
        return :mutually_assured_destruction

    elsif @player1.rank_of_card_at(0) == @player2.rank_of_card_at(0)
        puts "war type"
        return :war
    end
  end

  def spoils_of_war
  end

  def winner
    if type == :basic
      puts "in winner basic"
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        puts "player1 wins "
        return @player1
      else puts "player2 wins"
        return @player2
      end
    elsif type == :mutually_assured_destruction
      puts "in winner mutauall"
    elsif type == :war
      puts "in winner war"
    end

  end

  def pile_cards
  end

  def award_spoils
  end

end
