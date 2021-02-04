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

  def pile_cards
      if    turn_type == :mutually_assured_destruction
      elsif turn_type == :war
      else  turn_type == :basic
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
      if player1.deck.cards[2].rank > player2.deck.cards[2].rank
        player1
      else
        player2
      end
    elsif turn_type == :basic
      if player1.deck.remove_card.rank > player2.deck.remove_card.rank
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
