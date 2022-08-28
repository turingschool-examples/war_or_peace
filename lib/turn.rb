require 'pry'
class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      turn = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) and player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      turn = :war
    else player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) and player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      turn = :mutually_assured_destruction
    end
  end
  def winner
    if type == :basic
      winner = player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :war
      winner = player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    elsif type == :mutually_assured_destruction
      puts "No Winner"
    end
  end
  def basic_card_pile
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
  end
  def war_card_pile
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
  end
  def mutually_assured_destruction_card_pile
    @player1.deck.remove_card
    @player1.deck.remove_card
    @player1.deck.remove_card
    @player2.deck.remove_card
    @player2.deck.remove_card
    @player2.deck.remove_card
  end
  def draw_card_pile
    @player1.deck.cards.shuffle!
    @player2.deck.cards.shuffle!
  end
  def award_spoils(winner)
    @spoils_of_war.each do|card|
      winner.deck.add_card(card)
    end
  end
end
