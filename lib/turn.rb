class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    #what is convention here?
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)\
    && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      @type = :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @type = :war
    else
      @type = :basic
    end
  end
  def winner
    if @type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    elsif @type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    else
      "No Winner"
    end
  end
  def pile_cards
    if @type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif @type == :war
      #needed to split up into two times loops to get in right order
      3.times do
        @spoils_of_war << player1.deck.remove_card
      end
      3.times do
        @spoils_of_war << player2.deck.remove_card
      end
    else
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end
  def award_spoils(winner)
    @spoils_of_war.each do |spoils_card|
      winner.deck.add_card(spoils_card)
    end
  end
end
