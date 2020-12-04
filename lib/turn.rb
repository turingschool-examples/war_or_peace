class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0)   != @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :mutually_assured_destruction
    end
  end

  def winner_basic
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1
    else @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    end
  end

  def winner_war
    if  @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
    else @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @player2
    end
  end

  def winner
    if type   == :basic
      winner_basic
    elsif type == :war
    winner_war
    else
        puts "No Winner"
    end
  end


  def pile_cards_basic
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
  end

  def player_1_spoils
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player1.deck.remove_card
    @spoils_of_war << @player1.deck.remove_card
  end

  def player_2_spoils
    @spoils_of_war << @player2.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
    @spoils_of_war << @player2.deck.remove_card
  end

  def player_1_mutual_destruction
     @player1.deck.remove_card
     @player1.deck.remove_card
     @player1.deck.remove_card
  end

  def player_2_mutual_destruction
    @player2.deck.remove_card
    @player2.deck.remove_card
    @player2.deck.remove_card
  end

  def pile_cards
    if    type == :basic
      pile_cards_basic
    elsif type == :war
     @spoils_of_war << player_1_spoils
     @spoils_of_war << player_2_spoils
    else
    player_1_mutual_destruction
    player_2_mutual_destruction
    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war.shift
    winner.deck.cards << @spoils_of_war.shift
  end
end
