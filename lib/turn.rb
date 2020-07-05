require "./lib/deck"
require "./lib/card"
require "./lib/player"

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = ""
    @winner = ""
  end

  def type
    if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0))  && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      @type = ":mutually_assured_destruction"

    elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2))
      @type = ":war"

    elsif (@player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0))
      @type = ":basic"
    else
      @type = "end"
    end
  end

  def winner

    if @type == ":basic"
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = "player1"
      elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        @winner = "player2"
      end

    elsif @type == ":war"
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = "player1"
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @winner = "player2"
      end

    elsif @type == ":mutually_assured_destruction"
      @winner = "No Winner"
    end
  end

  def pile_cards
    if @type == ":basic"

      @spoils_of_war << @player1.deck.remove_card

      @spoils_of_war << @player2.deck.remove_card

    elsif @type == ":war"
      3.times do
        @spoils_of_war << @player1.deck.remove_card
      end
      3.times do
        @spoils_of_war << @player2.deck.remove_card
      end

    elsif @type == ":mutually_assured_destruction"
      pile = []
      3.times do
        pile << @player1.deck.remove_card
      end
      3.times do
        pile << @player2.deck.remove_card
      end
      pile.drop(6)
    end
  end

  def award_spoils
    if @winner == "player1"
      @player1.deck.cards << @spoils_of_war.shuffle
      @player1.deck.cards.flatten!
    elsif @winner = "player2"
      @player2.deck.cards << @spoils_of_war.shuffle
      @player2.deck.cards.flatten!
    end
  end
end
