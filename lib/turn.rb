require '../lib/deck'
require 'pry'
class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    p1c1 = @player1.deck.cards[0].rank
    p2c1 = @player2.deck.cards[0].rank
    p1c3 = @player1.deck.cards[2].rank
    p2c3 = @player2.deck.cards[2].rank

    if p1c1 != p2c1
      :basic
    elsif p1c1 == p2c1 && p1c3 != p2c3
      :war
    elsif p1c1 == p2c1 && p1c3 == p2c3
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
       if @player1.deck.cards[0].rank > @player2.deck.cards[0].rank
         return @winner = @player1
       else
         return @winner = @player2
       end
    elsif type == :war
      if @player1.deck.cards[2].rank > @player2.deck.cards[2].rank
        return @winner = @player1
      else
        return @winner = @player2
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      [player1, player2].each do |player|
        spoils_of_war.push player.deck.cards.delete_at(0)
      end
    elsif type == :war
      [player1, player2].each do |player|
        3.times { spoils_of_war.push player.deck.cards.delete_at(0) }
      end
    elsif type == :mutually_assured_destruction
      [player1, player2].each do |player|
        3.times { player.deck.remove_card }
      end
    end
  end

  def award_cards
    if @winner && spoils_of_war
      spoils_of_war.each do |card|
        @winner.deck.add_card(card)
      end
    end
  end

end
