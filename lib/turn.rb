


class Turn
attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1       = player1
    @player2       = player2
    @spoils_of_war = []
  end

  def type
    if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      return :mutually_assured_destruction

    elsif (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0))
      return :war

    else
      :basic
    end
  end

  def winner
    case type
    when :basic
      if (player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0))
        return player1

      elsif (player2.deck.rank_of_card_at(0) > player1.deck.rank_of_card_at(0))
        return player2
      end

    when :war
      if (player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2))
        return player1

      elsif (player2.deck.rank_of_card_at(2) > player1.deck.rank_of_card_at(2))
        return player2
      end

    when :mutually_assured_destruction
      return "No Winner"

    end
  end

  def pile_cards
    case type

    when :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    end


    #for :war - each player will send 3 cards (top 3) to spoils pile
    #for :mutually_assured_destruction - each player will remove 3 cards --
    #... for mad - not sent to spoils pile, but removed from players decks

    #we want the cards removed from the top of the deck during a turn to pile
    #then shovel those cards into spoils_of_war (not for mad)
    #then award the winner the spoils (not for mad)
    end

  def award_spoils(winner)
    spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
  end


  end
