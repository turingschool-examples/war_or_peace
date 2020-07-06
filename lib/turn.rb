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
    if (@player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0))
      @type = ":basic"
    elsif (@player1.deck.rank_of_card_at(0) == nil) || (@player2.deck.rank_of_card_at(0) == nil)
      @type = "end"
    else
      if (@player1.deck.cards[2] == nil) && (@player2.deck.cards[2] == nil)
        p1_drop = @player1.deck.cards.count
        p2_drop = @player2.deck.cards.count
        @player1.deck.cards.drop(p1_drop)
        @player2.deck.cards.drop(p2_drop)
        @player1.has_lost?
        @player2.has_lost?
      elsif @player2.deck.cards[2] == nil
        p2_drop = @player2.deck.cards.count
        @player2.deck.cards.drop(p2_drop)
        @player2.has_lost?
      elsif @player1.deck.cards[2] == nil
        p1_drop = @player1.deck.cards.count
        @player1.deck.cards.drop(p1_drop)
        @player1.has_lost?
      else
        if (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0))  && (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
          @type = ":mutually_assured_destruction"

        elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (@player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2))
          @type = ":war"
        end
      end
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
      3.times do
        @player1.deck.remove_card
      end
      3.times do
        @player2.deck.remove_card
      end
    end
  end

  def award_spoils

    if @winner == "player1"
      @player1.deck.cards << @spoils_of_war.shuffle!
      @player1.deck.cards.flatten!
    elsif @winner == "player2"
      @player2.deck.cards << @spoils_of_war.shuffle!
      @player2.deck.cards.flatten!
    end
  end
  def generate_cards
    suits = [:heart, :club, :diamond, :spade]
    standard_deck = []
    suits.each do |card_suit|
      standard_deck << Card.new(card_suit, "2", 2)
      standard_deck << Card.new(card_suit, "3", 3)
      standard_deck << Card.new(card_suit, "4", 4)
      standard_deck << Card.new(card_suit, "5", 5)
      standard_deck << Card.new(card_suit, "6", 6)
      standard_deck << Card.new(card_suit, "7", 7)
      standard_deck << Card.new(card_suit, "8", 8)
      standard_deck << Card.new(card_suit, "9", 9)
      standard_deck << Card.new(card_suit, "10", 10)
      standard_deck << Card.new(card_suit, "Jack", 11)
      standard_deck << Card.new(card_suit, "Queen", 12)
      standard_deck << Card.new(card_suit, "King", 13)
      standard_deck << Card.new(card_suit, "Ace", 14)
    end
    standard_deck.shuffle!
    @player1.deck.cards << standard_deck[0..25]
    @player1.deck.cards.flatten!

    @player2.deck.cards << standard_deck[26..51]
    @player2.deck.cards.flatten!
  end
end
