class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) and player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) and player1.deck.rank_of_card_at(2) != player2.deck.rank_of_card_at(2)
      :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner_basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
  end

  def winner_war
    #If a player only has one or two cards left and it matches with the other player's
    #delete the players last card/ last two cards
    # otherwise the method acting on the non existent card will throw an error
    if player1.deck.cards.size < 3 || player2.deck.cards.size < 3
      require "pry"; binding.pry
      if player1.deck.rank_of_card_at(1) > player2.deck.rank_of_card_at(1)
        player1
      else
        player2
      end
    elsif player1.deck.cards.size < 2 || player2.deck.cards.size < 2
        require "pry"; binding.pry
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif player1.deck.cards.size > 2 and player2.deck.cards.size > 2
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        player2
      end
    end
  end

  def winner_mad
    "No Winner"
  end

  def pile_cards
    spoils_of_war = []
    lost_cards = []
    if type == :basic
      spoils_of_war << player1.deck.cards[0]
      spoils_of_war << player2.deck.cards[0]
    elsif type == :war
      if player1.deck.cards.size > 2 and player2.deck.cards.size > 2
        spoils_of_war << player1.deck.cards[0..2]
        spoils_of_war << player2.deck.cards[0..2]
      elsif player1.deck.cards.size < 3 || player2.deck.cards.size < 3
        spoils_of_war << player1.deck.cards[0..1]
        spoils_of_war << player2.deck.cards[0..1]
      elsif player1.deck.cards.size < 2 || player2.deck.cards.size < 2
        spoils_of_war << player1.deck.cards[0]
        spoils_of_war << player2.deck.cards[0]
      end
    elsif type == :mutually_assured_destruction
      lost_cards << player1.deck.cards[0..2]
      lost_cards << player2.deck.cards[0..2]
    end
  end

  def award_spoils(winner)
    if type == :basic
      @spoils_of_war = pile_cards.shuffle
      winner.deck.cards << @spoils_of_war
      winner.deck.cards.flatten!
      # player2.deck.cards.flatten!
    elsif type == :war
      @spoils_of_war = pile_cards
      winner.deck.cards << @spoils_of_war
      winner.deck.cards.flatten!
      # player2.deck.cards.flatten!
    end
  end

  def remove_cards_from_player
    if type == :basic
      player2.deck.remove_card
      player1.deck.remove_card
    elsif type == :war || :mutually_assured_destruction
      3.times do
        player2.deck.remove_card
        player1.deck.remove_card
      end
    end
  end
end
