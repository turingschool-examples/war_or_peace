class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2, spoils_of_war = [])
    @player1 = player1
    @player2 = player2
    @spoils_of_war = spoils_of_war
  end

  def type
    if player1.deck.rank_of_card_at(0) !=
      player2.deck.rank_of_card_at(0)
      :basic
    elsif player1.deck.rank_of_card_at(0) ==
      player2.deck.rank_of_card_at(0)
      :war
    elsif (player1.deck.rank_of_card_at(0) ==
      player2.deck.rank_of_card_at(0) &&
      player1.deck.rank_of_card_at(2) ==
      player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    end
  end

  def winner
    # convert type return value from a symbol to a string
    if type.to_s == "basic"
      # if player 1 has a higher top card they win, vise versa
      if player1.deck.rank_of_card_at(0) <
        player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type.to_s == "war"
      # if player 1 has a higher card 2 then they win, vise versa
      if player1.deck.rank_of_card_at(2) <
        player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
      # if its destruction there is no winner
    elsif type.to_s == "mutually_assured_destruction"
      'No Winner'
    end
  end

  def pile_cards
    # spoils pile
    spoils_of_war = []
    # convert type return value from a symbol to a string
    if type.to_s == "basic"
      # add top cards to spoils of war
      spoils_of_war << player1.deck.cards[0]
      spoils_of_war << player2.deck.cards[0]
      # remove cards that have been played
      player1.deck.remove_card
      player2.deck.remove_card
      @spoils_of_war = spoils_of_war
      return
    elsif type.to_s == "war"
      # add top 3 cards to spoils of waer
      spoils_of_war.push(player1.deck.cards[0..2])
      spoils_of_war.push(player2.deck.cards[0..2])
      # remove top 3 cards
      player1.deck.remove_card
      player1.deck.remove_card
      player1.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      @spoils_of_war = spoils_of_war
      return
    elsif  type.to_s == "mutually_assured_destruction"
      # remove top 3 cards
      player1.deck.remove_card
      player1.deck.remove_card
      player1.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      player2.deck.remove_card
      return
    end
  end

  def award_spoils(winner)
    if winner == player1
      player1.deck.add_card(spoils_of_war)
      return
    elsif winner == player2
      player2.deck.add_card(spoils_of_war)
      return
    end
  end

end
