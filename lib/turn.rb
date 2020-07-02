class Turn
  # readable attributes for player1, player2, and spoils
  attr_accessor :player_1, :player_2, :spoils_of_war

  # A turn is created with two players
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    # This is the one I'm confused on... do I include spoils of war here? and how?
    # After reading through project, seeing this variable is an array
    @spoils_of_war = []
  end

  # Create a type method
    # Will have three variables :basic, :war, :mutually_assured_destruction
    # Looks like an if statement
  def type
    # since i'm creating three variables in the if statement, do I need to create
    # them up here as well? (accessor?)

    # error told me rank of card method is not accessible. Probably need to call class first!
    # fixed and success!
    # Oh... wait... no, the test should have actually failed

    # require 'pry'; binding.pry
    # got the if statement to work properly... it's the :basic that's the issue right now
    # Huh... it works now. Unsure what I fixed
    if player_1.deck.rank_of_card_at(0) != player_2.deck.rank_of_card_at(0)
      # p "x"
      :basic
    elsif (player_1.deck.rank_of_card_at(0) == player_2.deck.rank_of_card_at(0)) && (player_1.deck.rank_of_card_at(2) == player_2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif player_1.deck.rank_of_card_at(0) == player_2.deck.rank_of_card_at(0)
      :war
    else
      p "Oops"
    end
  end



  # Create a winner method
    # Looks like another if statement
    # :basic - return player with higher rank_of_card_at(0)
    # :war - return player higher_rank_of_card_at(2)
    # :mutually - return NO WINNER

    def winner
      # Learned from Tim today that I can put the pry in the class and write the method from there!
      # Ooh... found something. My type method isn't storing the variable I'm assigning
      # or, if it is, I'm unable to access it.
      # Hmmm... that wasn't the issue. I will try to write this if statement first

      if type == :basic
        # researched "ruby return greater of two values"
        # Hmmm, the .max worked, but it returned the rank
        # might have to equalities instead of enumerable
        # [player_1.deck.rank_of_card_at(0), player_2.deck.rank_of_card_at(0)].max
        # gonna try a nested if statement
        # SUCCESS!!!
        if player_1.deck.rank_of_card_at(0) > player_2.deck.rank_of_card_at(0)
          player_1
        else
          player_2
        end
      elsif type == :war
        if player_1.deck.rank_of_card_at(2) > player_2.deck.rank_of_card_at(2)
          player_1
        else
          player_2
        end
      elsif type == :mutually_assured_destruction
        p "No Winner. DUN DUN DUUUUUNNNN!"
      else
        p "Oops"
      end
    end

  # Create pile_cards method
    # when called - cards sent from player deck to spoils_of_war (so... this variable is an array?)
    # :basic - both players send top card to spoils
    # :war - both players send top three to spoils
    # :mutually - both players send top three cards to REMOVE

  # Create award_spoils method
    # adds spoils array (IT IS AN ARRAY! I can update my initialize)
    # to the WINNER of the turn
end
