require './lib/player'

class Turn

  attr_reader :player_1, :player_2, :spoils_of_war, :won_round
  attr_accessor :game_type

  def initialize (player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @spoils_of_war = []
    @game_type = nil
    @won_round = nil
  end

  #the 1st and 3rd card from both player's decks and compares them. Based on their outcome will determine the game type
  def type

    if @player_1.deck.cards[0].rank != @player_2.deck.cards[0].rank
      return @game_type = :basic
    else
      if @player_1.deck.cards[2].rank == @player_2.deck.cards[2].rank
        return @game_type = :mutually_assured_destruction
      else
        return @game_type = :war
      end
    end
  end

  #the 1st and 3rd card from both player's decks are compared. Based on their outcomes will determine the winner of the round.
  def winner

    if @game_type == :basic
      if @player_1.deck.cards[0].rank > @player_2.deck.cards[0].rank
        @won_round = @player_1
        return @player_1
      else
        @won_round = @player_2
        return @player_2
      end

    else
      if @game_type ==:mutually_assured_destruction
        return "No winner."

      else
        # :war game type
        if @player_1.deck.cards[2].rank > @player_2.deck.cards[2].rank
          @won_round = @player_1
          return @player_1
        else
          @won_round = @player_2
          return @player_2
        end

      end
    end

  end

  def pile_cards
    if @game_type == :basic
      @spoils_of_war << @player_1.deck.cards[0]
      @player_1.deck.remove_card

      @spoils_of_war << @player_2.deck.cards[0]
      @player_2.deck.remove_card
      return @spoils_of_war

    elsif @game_type == :war
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
      3.times do
        @player_1.deck.remove_card
        @player_2.deck.remove_card
      end
      return @player_1.deck.cards, @player_2.deck.cards

    end
  end

  def award_spoils
    won_round.deck.cards.concat(spoils_of_war)
  end

end
