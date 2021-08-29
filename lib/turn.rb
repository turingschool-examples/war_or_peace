class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type,
              :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type
    @winner = winner
  end

  def type
    if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :"No Winner"
    elsif player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      @player1
    elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      @player2
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && (player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2))
      @player1
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && (player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2))
      @player2
    end
  end

  def pile_cards
    if type == :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    elsif type == :war
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
      spoils_of_war << player2.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    elsif type == :mutually_assured_destruction
      player1.deck.remove_card
      player2.deck.remove_card
      player1.deck.remove_card
      player2.deck.remove_card
      player1.deck.remove_card
      player2.deck.remove_card
    end
  end

  def award_spoils(winner)
    (winner.deck.cards << spoils_of_war).flatten!
    #@spoils_of_war = spoils_of_war
    #winner.deck << @spoils_of_war
    #winner = @winner
    #if winner == player1
    #  (player1.deck.cards << spoils_of_war).flatten!
    #elsif winner == player2
  #    (player2.deck.cards << spoils_of_war).flatten!
    #end
  end

  def start(player1, player2)
    puts "Welcome to War! (or Peace) This game will be played with 52 cards.
  The players today are #{player1.name} and #{player2.name}.
  Type 'GO' to start the game!"
  end
end
