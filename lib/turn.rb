class Turn
  attr_reader  :player1,
               :player2,
               :spoils_of_war,
               :player_1_rank_0,
               :player_1_rank_2,
               :player_2_rank_0,
               :player_2_rank_2,
               :game_over

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  #add cards in spoils_of_war to the winner of the turn
  def award_spoils(winner_of_turn)
    if winner_of_turn == "No Winner"
      return
    end
    @spoils_of_war.each do |card|
      winner_of_turn.deck.cards << card
    end
  end

  #cards will be sent from player deck to spoils_of_war
  def pile_cards
    turn_type = type
    if turn_type ==  :basic
      basic_pile
    elsif turn_type == :war
      war_pile
    elsif turn_type == :mutally_assured_destruction
      destruction_pile
    end
  end

  def basic_pile
    @spoils_of_war << player1.deck.cards.first
    player1.deck.remove_card
    @spoils_of_war << player2.deck.cards.first
    player2.deck.remove_card
  end

  def war_pile
    3.times do
      @spoils_of_war << player1.deck.cards.first
      player1.deck.remove_card
      @spoils_of_war << player2.deck.cards.first
      player2.deck.remove_card
    end
  end

  def destruction_pile
    3.times do
      player1.deck.remove_card
      player2.deck.remove_card
    end
  end

  #basic, war, of mutally_assured_destruction
  def type
    get_ranks
    if @player_1_rank_0 == @player_2_rank_0 && @player_1_rank_2 == @player_2_rank_2
      :mutally_assured_destruction
    elsif @player_1_rank_0 == @player_2_rank_0
      :war
    elsif @player_1_rank_0 != @player_2_rank_0
      :basic
    end
  end

  def get_ranks
    @player_1_rank_0 = @player1.deck.rank_of_card_at(0)
    @player_2_rank_0 = @player2.deck.rank_of_card_at(0)
    @player_1_rank_2 = @player1.deck.rank_of_card_at(2)
    @player_2_rank_2 = @player2.deck.rank_of_card_at(2)
  end

  #determines winner of war
  def winner
    turn_type = type
    #if basic
    if turn_type ==  :basic
      if @player_1_rank_0 > @player_2_rank_0
        @player1
      else
        @player2
      end
    #elsif war
    elsif turn_type == :war
      if @player_1_rank_2 > @player_2_rank_2
        @player1
      else
        @player2
      end
    #elsif mutally_assured_destruction
    elsif type == :mutally_assured_destruction
      "No Winner"
    end
  end
end
