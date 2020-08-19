class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
       @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return :mutually_assured_destructrion
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war
    end
  end

  def winner
    if type == :basic
      basic_war_winner
    elsif type == :war
      war_winner
    elsif type == :mutually_assured_destructrion
      mutually_assured_destructrion_winner
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      player1.deck.remove_card
      player2.deck.remove_card
    elsif type == :war

    elsif type == :mutually_assured_destructrion

    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
  end

  def basic_war_winner
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      return @player1
    else
      return @player2
    end
  end

  def war_winner

  end

  def mutually_assured_destructrion_winner

  end


end
