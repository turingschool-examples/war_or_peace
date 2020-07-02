class Turn
  # readable attributes for player1, player2, and spoils
  # attr_accessor :player_1, :player_2, :spoils_of_war

  # A turn is created with two players
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    # This is the one I'm confused on... do I include spoils of war here? and how?
    # After reading through project, seeing this variable is an array
  #  @spoils_of_war = []
  end

  # Create a type method
    # Will have three variables :basic, :war, :mutually_assured_destruction
    # Looks like an if statement

  # Create a winner method
    # Looks like another if statement
    # :basic - return player with higher rank_of_card_at(0)
    # :war - return player higher_rank_of_card_at(2)
    # :mutually - return NO WINNER

  # Create pile_cards method
    # when called - cards sent from player deck to spoils_of_war (so... this variable is an array?)
    # :basic - both players send top card to spoils
    # :war - both players send top three to spoils
    # :mutually - both players send top three cards to REMOVE

  # Create award_spoils method
    # adds spoils array (IT IS AN ARRAY! I can update my initialize)
    # to the WINNER of the turn
end
