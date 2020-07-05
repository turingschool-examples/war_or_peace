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
    # Had to update order since mutually_assured breaks game
    if player_1.deck.rank_of_card_at(0) == player_2.deck.rank_of_card_at(0) && player_1.deck.rank_of_card_at(2) == player_2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    # elsif player_1.deck.rank_of_card_at(0) == player_2.deck.rank_of_card_at(0)
    #   :war
    elsif player_1.deck.rank_of_card_at(0) != player_2.deck.rank_of_card_at(0)
      :basic
    else
      :war
    end
  end


  # Added in this method to simplify as I'm working on award_spoils method
  def winner_players
    if player_1.deck.rank_of_card_at(0) > player_2.deck.rank_of_card_at(0)
      :basic_player_1
    elsif player_1.deck.rank_of_card_at(0) < player_2.deck.rank_of_card_at(0)
      :basic_player_2
    elsif player_1.deck.rank_of_card_at(2) > player_2.deck.rank_of_card_at(2)
      :war_player_1
    elsif player_1.deck.rank_of_card_at(2) < player_2.deck.rank_of_card_at(2)
      :war_player_2
    else
      :mutual_no_winner
    end
  end

    # Create a winner method
    # Looks like another if statement
    # :basic - return player with higher rank_of_card_at(0)
    # :war - return player higher_rank_of_card_at(2)
    # :mutually - return NO WINNER
      # Learned from Tim today that I can put the pry in the class and write the method from there!
      # Ooh... found something. My type method isn't storing the variable I'm assigning
      # or, if it is, I'm unable to access it.
      # Hmmm... that wasn't the issue. I will try to write this if statement first
      # researched "ruby return greater of two values"
      # Hmmm, the .max worked, but it returned the rank
      # might have to equalities instead of enumerable
      # gonna try a nested if statement
      # SUCCESS!!!

      # if type == :basic
      #   # [player_1.deck.rank_of_card_at(0), player_2.deck.rank_of_card_at(0)].max
      #   if player_1.deck.rank_of_card_at(0) > player_2.deck.rank_of_card_at(0)
      #     (player_1.name).to_s + ' won 2 cards :)'
      #   else
      #     (player_2.name).to_s + ' won 2 cards :)'
      #   end
      # elsif type == :war
      #   if player_1.deck.rank_of_card_at(2) > player_2.deck.rank_of_card_at(2)
      #     'WAR! - ' + (player_1.name).to_s + ' won 6 cards. *\(^o^)/*'
      #   else
      #     'WAR! - ' + (player_2.name).to_s + ' won 6 cards. *\(^o^)/*'
      #   end
      # elsif type == :mutually_assured_destruction
      #   'Mutually Assured Destruction! 6 cards removed from the deck. (;_;)'
      # else
      #   "Oops"
      # end

  def winner
    if winner_players == :basic_player_1
      player_1
    elsif winner_players == :basic_player_2
      player_2
    elsif winner_players == :war_player_1
      player_1
    elsif winner_players == :war_player_2
      player_2
    elsif winner_players == :mutual_no_winner
      'Mutually Assured Destruction! 6 cards removed from the deck. (;_;)'
    else
      'OOPS - TESTING'
    end
  end

  # Create pile_cards method
    # when called - cards sent from player deck to spoils_of_war (so... this variable is an array?)
    # :basic - both players send top card to spoils
    # :war - both players send top three to spoils
    # :mutually - both players send top three cards to REMOVE
  def pile_cards
    if type == :basic
      # 'type = :basic' + ' AND '+ winner
      # spoils_of_war << player_1.deck.remove_card
      # spoils_of_war << player_2.deck.remove_card
      spoils_of_war << player_1.deck.cards.first
      spoils_of_war << player_2.deck.cards.first
    elsif type == :war
      # 'type = :war' + ' AND ' + winner
      # There has to be an easier way to repeat this method
      # Found it! .times and do block will do the trick
      # spoils_of_war << player_1.deck.remove_card
      # spoils_of_war << player_2.deck.remove_card
      spoils_of_war << player_1.deck.cards[0]
      spoils_of_war << player_2.deck.cards[0]
      spoils_of_war << player_1.deck.cards[1]
      spoils_of_war << player_2.deck.cards[1]
      spoils_of_war << player_1.deck.cards[2]
      spoils_of_war << player_2.deck.cards[2]
    elsif type == :mutually_assured_destruction
      # 'type = :mutual' + ' AND ' + winner
      3.times do
        player_1.deck.remove_card
        player_2.deck.remove_card
      end
      # Removed after testing
      # [player_1.deck, player_2.deck]
    end
  end

  # Create award_spoils method
    # adds spoils array (IT IS AN ARRAY! I can update my initialize)
    # to the WINNER of the turn
    # To create this method, I may need to go simplify my winner method
    # It also looks like I need to remove my silly string lines.
    # Looking ahead, I can add the print line messages in the game.rb file
    # got a basic method working
    # researched how to delete the stuff in an array. I think .clear
    # Hmmmm... errors
    # ran pry to test for bugs
    # looks like everything runs okay until pile_cards.
    # Seems like because I'm literally deleting a card, a new winner must be declared because the cards are now gone
        #   def award_spoils
        #     if type == :basic
        #       if winner_players == :basic_player_1
        #         winner.deck.cards.push(spoils_of_war).flatten!
        #         player_1.deck.remove_card
        #         player_2.deck.remove_card
        #         # researched why my array was [array [array]]
        #         # found answer as .flatten!
        #         spoils_of_war.clear
        #       elsif winner_players == :basic_player_2
        #         winner.deck.cards.push(spoils_of_war).flatten!
        #         player_1.deck.remove_card
        #         player_2.deck.remove_card
        #         spoils_of_war.clear
        #       else
        #         p "OOPS basic under awards - TEST TEST"
        #       end
        #
        #     elsif type == :war
        #       if winner_players == :war_player_1
        #         winner.deck.cards.push(spoils_of_war).flatten!
        #         3.times do
        #           player_1.deck.remove_card
        #           player_2.deck.remove_card
        #         end
        #         spoils_of_war.clear
        #       elsif winner_players == :war_player_2
        #         winner.deck.cards.push(spoils_of_war).flatten!
        #         3.times do
        #           player_1.deck.remove_card
        #           player_2.deck.remove_card
        #         end
        #         spoils_of_war.clear
        #       else
        #         p "OOPS war under awards - TEST TEST"
        #       end
        #
        #     else
        #       spoils_of_war.clear
        #     end
        #   end
        # end


  # For the life of me, the method was working, and now it's not
  # Gonna NUKE
  def award_spoils(winner)
    if type == :basic
      winner.deck.cards.push(spoils_of_war).flatten!
      player_1.deck.remove_card
      player_2.deck.remove_card
      spoils_of_war.clear
    elsif type == :war
      winner.deck.cards.push(spoils_of_war).flatten!
      3.times do
        player_1.deck.remove_card
        player_2.deck.remove_card
        spoils_of_war.clear
      end
    end
  end

end
