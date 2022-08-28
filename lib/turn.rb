require './lib/deck'

class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      if @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
        :mutually_assured_destruction
      else
        :war
      end
    else
      :basic
    end
  end

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    elsif type == :mutually_assured_destruction
      'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war.push(@player1.deck.cards[0])
      @spoils_of_war.push(@player2.deck.cards[0])
      @player1.deck.remove_card(@player1.deck.cards[0])
      @player2.deck.remove_card(@player2.deck.cards[0])
    elsif type == :war
      for a in 1..3 do
        @spoils_of_war.push(@player1.deck.cards[0])
        @spoils_of_war.push(@player2.deck.cards[0])
        @player1.deck.remove_card(@player1.deck.cards[0])
        @player2.deck.remove_card(@player2.deck.cards[0])
      end
    elsif type == :mutually_assured_destruction
      for a in 1..3 do
        @player1.deck.remove_card(@player1.deck.cards[0])
        @player2.deck.remove_card(@player2.deck.cards[0])
      end
    end
  end

  def award_spoils(player)
    @spoils_of_war.each do |card|
      player.deck.add_card(card)
    end
  end
end
