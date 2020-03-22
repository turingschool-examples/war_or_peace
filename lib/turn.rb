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
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        return :basic
    elsif
      @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) &&
      @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      return :war
    else
      return :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    elsif
      @player2
    end

    #if turn type is basic and if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
    #player1
    #else player2
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    if type == :basic
      @spoils_of_war.map do |card|
        winner.deck.cards << card
    #player gets two cards added to spoils of war added to their array
    #winner.deck.cards << @spoils_of_war
      @spoils_of_war = [] 
      end
    end
  end
end
