require './lib/player'
require 'pry'

class Turn

  attr_reader :player_1, :player_2, :spoils_of_war

  def initialize (player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @spoils_of_war = []
  end

  #the 1st and 3rd card from both player's decks and compares them. Based on their outcome will determine the game type
  def type (p1_card1_rank,
            p1_card2_rank,
            p2_card1_rank,
            p2_card2_rank)

    if p1_card1_rank != p2_card1_rank
      return :basic
    else
      if p1_card2_rank == p2_card2_rank
        return :mutually_assured_destruction
      else
        return :war
      end
    end
  end

  #the 1st and 3rd card from both player's decks are compared. Based on their outcomes will determine the winner of the round.
  def winner (p1_card1_rank,
              p1_card2_rank,
              p2_card1_rank,
              p2_card2_rank)

    if p1_card1_rank != p2_card1_rank

      # :basic game type
      if p1_card1_rank > p2_card1_rank
        return @player_1
      else
        return @player_2
      end

    else
      # :mutually_assured_destruction game type
      if p1_card2_rank == p2_card2_rank
        return "No winner."

      else
        # :war game type
        if p1_card2_rank > p2_card2_rank
          return @player_1
        else
          return @player_2
        end

      end
    end

  end

  def pile_cards(game_type)
    if game_type == :basic
      @spoils_of_war << @player_1.deck.cards[0]
      @player_1.deck.remove_card

      @spoils_of_war << @player_2.deck.cards[0]
      @player_2.deck.remove_card

      return @spoils_of_war
    elsif game_type == :war
      3.times do
        @spoils_of_war << @player_1.deck.cards[0]
        @player_1.deck.remove_card
      end

      3.times do
        @spoils_of_war << @player_2.deck.cards[0]
        @player_2.deck.remove_card
      end
      return @spoils_of_war
    else
    end
  end

  def award_spoils

  end

end
