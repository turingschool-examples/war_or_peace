

class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
#############################
  def cards_to_spoils(player)
    if player.deck.cards.length >= 3
      3
    elsif player.deck.cards.length == 2
      2
    elsif player.deck.cards.length == 1
      1
    elsif player.deck.cards.length == 0
      0
    end
  end
#############################
  def three_cards?(player)
    player.deck.cards.length >= 3
  end
#############################
  def first_cards_equal?
    if cards_to_spoils(player1) > 0 && cards_to_spoils(player2) > 0
    @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
    end
  end
#############################
  def third_cards_equal?
    if three_cards?(player1) && three_cards?(player2)
      @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    else
      false
    end
  end
#############################
  def type
    if !first_cards_equal?
      :basic
    elsif  first_cards_equal? && third_cards_equal?
      :mutually_assured_destruction
    elsif first_cards_equal?
      :war
    end
  end
  ##########################

  def winner
    if type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        @player2
      end
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @player2
      end
    elsif type == :mutually_assured_destruction
      "No Winner"
    end

  end #winner
#############################
  def pile_cards
    @spoils_of_war = []
    if type == :basic
      # add to spoils
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      # delete spoils cards
      @player1.deck.remove_card
      @player2.deck.remove_card
    elsif type == :war || type == :mutually_assured_destruction
      #player1 adds to spoils and looses cards
      cards_to_spoils(player1).times do
        #binding.pry
        @spoils_of_war << @player1.deck.cards[0]
        @player1.deck.remove_card
      end
      #player 2 adds to spoils and looses cards
      cards_to_spoils(player2).times do
       @spoils_of_war << @player2.deck.cards[0]
        @player2.deck.remove_card
      end
    end
    
  end #pile cards




end #THE FINAL END
