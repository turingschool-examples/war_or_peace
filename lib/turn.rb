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
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      player1.deck.remove_card
      player2.deck.remove_card
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0..2]
      @spoils_of_war << @player2.deck.cards[0..2]
      @spoils_of_war = @spoils_of_war.flatten
      remove_3_cards_from_players
    elsif type == :mutually_assured_destruction
      remove_3_cards_from_players
    end
  end

  def remove_3_cards_from_players
    3.times do
      player1.deck.remove_card
      player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
  end

  def winner
    if type == :basic
      basic_war_winner
    elsif type == :war
      war_winner
    elsif type == :mutually_assured_destruction
      "No Winner"
    end
  end

  def basic_war_winner
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    else
      @player2
    end
  end

  def war_winner
    if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      @player1
    else
      @player2
    end
  end
end
