require './lib/player'

class Turn
  attr_accessor :player1,
                :player2,
                :spoils_of_war,
                :winner

  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end

  def type
    @player1_rank0 = @player1.deck.rank_of_card_at(0)
    @player2_rank0 = @player2.deck.rank_of_card_at(0)
    if @player1.deck.rank_of_card_at(2) != nil
      @player1_rank2 = @player1.deck.rank_of_card_at(2)
    end
    if @player2.deck.rank_of_card_at(2) != nil
      @player2_rank2 = @player2.deck.rank_of_card_at(2)
    end

    if @player1_rank0 == @player2_rank0 && @player1_rank2 == @player2_rank2
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
       'No Winner'
    elsif type == :war
      if @player1.deck.rank_of_card_at(2).to_i > @player2.deck.rank_of_card_at(2).to_i
         @player1
      else
         @player2
      end
    elsif type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        @player2
      end
    end
  end

  def pile_cards
    @winner = winner
  if type == :mutually_assured_destruction
    @player1.deck.cards.slice!(0..2)
    @player2.deck.cards.slice!(0..2)
  elsif type == :war
      @spoils_of_war += @player1.deck.cards.values_at(0..2)
      @player1.deck.cards.slice!(0..2)

      @spoils_of_war += @player2.deck.cards.values_at(0..2)
      @player2.deck.cards.slice!(0..2)
  elsif type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end

  def award_spoils
    if @winner == @player1
      @spoils_of_war.shuffle!
      @spoils_of_war.each do |spoil|
        @player1.deck.cards << spoil
      end
    else
      @spoils_of_war.shuffle!
      @spoils_of_war.each do |spoil|
        @player2.deck.cards << spoil
      end
  end
end
end
