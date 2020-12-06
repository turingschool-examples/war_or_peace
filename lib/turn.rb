class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    @type ||= find_type
  end

  def find_type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :war
      if @player1.has_lost? || @player2.has_lost?
        if @player1.has_lost?
          @player2
        else
          @player1
        end
      elsif @player1.deck.cards.length == 1 || @player2.deck.cards.length == 1
        winner_from_rank(0)
      elsif @player1.deck.cards.length <= 2 || @player2.deck.cards.length <= 2
        winner_from_rank(1)
      else
        winner_from_rank(2)
      end
    elsif type == :basic
      winner_from_rank(0)
    end
  end

  def winner_from_rank(index)
    if @player1.deck.rank_of_card_at(index) > @player2.deck.rank_of_card_at(index)
      @player1
    else
      @player2
    end
  end

  def pile_cards
    if type == :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.remove_card
      end
      3.times do
        @spoils_of_war << @player2.deck.remove_card
      end
    elsif type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |spoil|
      winner.deck.add_card(spoil)
    end
  end
end
