require 'pry'
class Turn
  attr_reader  :player1,
  :player2,
  :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  #add cards in spoils_of_war to the winner of the turn
  def award_spoils
  end

  #cards will be sent from player deck to spoils_of_war
  def pile_cards
    #if :basic, send top card
    if type ==  :basic
      @spoils_of_war << player1.deck.cards.first
      player1.deck.remove_card
      @spoils_of_war << player2.deck.cards.first
      player2.deck.remove_card
    #if :war, send top 3 cards
    elsif type == :war
      3.times do
        @spoils_of_war << player1.deck.cards.first
        player1.deck.remove_card
        @spoils_of_war << player2.deck.cards.first
        player2.deck.remove_card
      end
    #if :destruction, get rid of top 3 cards
    elsif type == :mutally_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end

  end

  #basic, war, of mutally_assured_destruction
  def type
    player_1_rank_0 = player1.deck.rank_of_card_at(0)
    player_2_rank_0 = player2.deck.rank_of_card_at(0)
    player_1_rank_2 = player1.deck.rank_of_card_at(2)
    player_2_rank_2 = player2.deck.rank_of_card_at(2)

    #if rank_of_card_at(0) are not the same, then basic
    if player_1_rank_0 != player_2_rank_0
      :basic
    #if rank_of_card_at(0) and (2) are the same,
    #then mutally_assured_destruction
    elsif player_1_rank_0 == player_2_rank_0 &&
      player_1_rank_2 == player_2_rank_2
      :mutally_assured_destruction
    #if rank_of_card_at(0) are the same, then war
    elsif player_1_rank_0 == player_2_rank_0
      :war
    end
  end

  #determines winner of war
  def winner
    #if basic
    if type ==  :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1.name
      else
        player2.name
      end
    #elsif war
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1.name
      else
        player2.name
      end
    #elsif mutally_assured_destruction
    elsif type == :mutally_assured_destruction
      "No Winner"
    end
  end
end
