class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if p1_card.deck.rank_of_card_at(0) != p2_card.deck.rank_of_card_at(0)
     return :basic
    elsif p1_card.deck.rank_of_card_at(0) == p2_card.deck.rank_of_card_at(0)
      return :war
    elsif p1_card.deck.rank_of_card_at(0) == p2_card.deck.rank_of_card_at(0) && p1_card.deck.rank_of_card_at(2) == p2_card.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    end
  end

  def winner
    p1_card = @player1.deck.rank_of_card_at(0)
    p2_card = @player2.deck.rank_of_card_at(0)

    if p1_card > p2_card
     return @player1
    else
      return @player2
    end
  end

  def pile_cards
    @type
    # it's analyzing whether the players cards fit into into each catagory
    if :basic
      #use type method to validate my :basic
      @spoils_of_war << @player1.deck.shift
      @spoils_of_war << @player2.deck.shift
      require 'pry';binding.pry
    elsif :war
      @spoils_of_war << @player1.deck.drop(3)
      @spoils_of_war << @player2.deck.drop(3)
    elsif :mutually_assured_destruction
      @player1.deck.drop(3)
      @player2.deck.drop(3)
    end

  end

  def award_spoils
      turn.winner << @spoils_of_war
  end


end
