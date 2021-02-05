class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = [:basic, :war, :mutually_assured_destruction]
  end

  def awards_spoils(winner)
    @spoils_of_war.each do |card|
      winner.deck.cards << card
    end
  end

  def pile_cards
      if    turn_type == :mutually_assured_destruction
        3.times {player1.deck.remove_card}
        3.times {player2.deck.remove_card}
      elsif turn_type == :war
        3.times {@spoils_of_war << player1.deck.remove_card}
        3.times {@spoils_of_war << player2.deck.remove_card}
      else
        @spoils_of_war << player1.deck.remove_card
        @spoils_of_war << player2.deck.remove_card
    end
  end

  def turn_type
    if    player1.deck.cards[0].rank == player2.deck.cards[0].rank &&
          player1.deck.cards[2].rank == player2.deck.cards[2].rank
      @type[2]
    elsif player1.deck.cards[0].rank == player2.deck.cards[0].rank
      @type[1]
    else  player1.deck.cards[0].rank != player2.deck.cards[0].rank
      @type[0]
    end
  end

  def winner
    if    turn_type == :mutually_assured_destruction
      "No Winner"
    elsif turn_type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    elsif turn_type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    end
  end

  def players_names
    [@player1.name, @player2.name]
  end



end
