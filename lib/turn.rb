require './lib/player'

class Turn

  attr_reader :player_1, :player_2, :spoils_of_war

  def initialize (player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @spoils_of_war = []
  end

  #the 1st and 3rd card from both player's decks and compares them. Based on their outcome will determine the game type
  #note if the player needs more than 2 cards to play but doesn't have enough will return :lost for whichever player lost
  def type

    if @player_1.deck.cards[0].rank != @player_2.deck.cards[0].rank
        return :basic
    elsif @player_1.deck.cards[2].rank == @player_2.deck.cards[2].rank
        return :mutually_assured_destruction
    else
        return :war
    end
  end #end of type

  #the 1st and 3rd card from both player's decks are compared. Based on their outcomes will determine the winner of the round.
  def winner

    if type == :basic
      if @player_1.deck.cards[0].rank > @player_2.deck.cards[0].rank
        return @player_1
      else
        return @player_2
      end
    elsif type == :mutually_assured_destruction
      return "No winner."
    elsif type == :war
      if @player_1.deck.cards[2].rank > @player_2.deck.cards[2].rank
        return @player_1
      else
        return @player_2
      end
    end
  end #end of winner

  def pile_cards

    #removes the first card from each player's decks and adds them to the spoils_of_war pile
    if type == :basic
      @spoils_of_war << @player_1.deck.cards[0]
      @player_1.deck.remove_card

      @spoils_of_war << @player_2.deck.cards[0]
      @player_2.deck.remove_card

      return @spoils_of_war

    #removes three top most cards each player's decks and adds them to the spoils_of_war pile
    elsif type == :war
      3.times do
        @spoils_of_war << @player_1.deck.cards[0]
        @player_1.deck.remove_card
      end
      3.times do
        @spoils_of_war << @player_2.deck.cards[0]
        @player_2.deck.remove_card
      end
      return @spoils_of_war

    #removes the three top most cards from each player's deck
    else # :mutually_assured_destruction
      3.times do
        @player_1.deck.remove_card
        @player_2.deck.remove_card
      end
      return @player_1.deck.cards, @player_2.deck.cards

    end
  end

  def award_spoils(won)
    spoils = won.deck.cards.concat(@spoils_of_war)
    @spoils_of_war = []
    spoils
  end

end #end of Turn class
