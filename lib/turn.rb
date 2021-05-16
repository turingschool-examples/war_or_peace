class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def type
    :basic
    # whichever player has a higher rank_of_card_at(0)
    :war
    # whichever player has a higher rank_of_card_at(2)
    :mutually_assured_destruction
    # neither player has a higher rank_of_card_at(2)
    return "No winner"
  end

  def pile_cards
    # for :basic turns, each player's top card is sent to the spoils pile
    # for :war turns, each player sends top 3 cards to the spoils pile
    # for :mutually_assured_destruction turns, each player removes cards from play
      # these cards are removed from play, not to be placed in the spoils pile
  end

  def award_spoils
     winner = []
     winner << spoils_of_war
  end
end
