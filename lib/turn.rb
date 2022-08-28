class Turn 
attr_accessor :spoils_of_war, 
              :type, 
              :pile_cards,
              :award_spoils, 
              :player1, 
              :player2, 
              :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
 
  def type 
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
       @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner 
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      elsif @player2.deck.rank_of_card_at(0) > @player1.deck.rank_of_card_at(0)
        @player2
      end
    elsif type == :war 
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      elsif @player2.deck.rank_of_card_at(2) > @player1.deck.rank_of_card_at(2)
        @player2
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    end 
  end

  def pile_cards
    if type == :basic 
      @spoils_of_war << @player1.deck.cards.shift
        #  require 'pry';binding.pry
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :war 
      3.times do 
        @spoils_of_war << @player1.deck.cards.shift
        @spoils_of_war << @player2.deck.cards.shift
      end 
    elsif type == :mutually_assured_destruction
      3.times do 
        @player1.deck.cards.shift
        @player2.deck.cards.shift
      end 
    end 
  end

  def award_spoils(winner)
    if winner != "No Winner"
      winner.deck.cards.concat(@spoils_of_war)
    end
  end 
end