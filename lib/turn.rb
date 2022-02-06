require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/standard_deck'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :MAD
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @MAD = "No Winner"
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutally_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
     :war
   else
     :basic
    end
  end
  #
  # def winner
  #   if type == :basic
  #     if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) == true
  #       return @player1
  #     elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0) == true
  #       return @player2
  #     end
  #   elsif type == :war
  #     if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2) == true
  #       return @player1
  #     elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2) == true
  #       return @player2
  #     end
  #   elsif type == :mutually_assured_destruction
  #     @MAD
  #   end
  # end
  def winner
    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) == true
      return @player1
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0) == true
      return @player2
    elsif @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2) == true
      return @player1
    elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2) == true
      return @player2
    else
      return @MAD
    end
  end

  def pile_cards
    if type == :basic
      cards = [@player1.deck.remove_card,  @player2.deck.remove_card]
      cards.each do |card|
        @spoils_of_war.push(card)
      end
    elsif type == :war
      cards = [@player1.deck.cards.shift, @player1.deck.cards.shift, @player1.deck.cards.shift, @player2.deck.cards.shift, @player2.deck.cards.shift, @player2.deck.cards.shift]
      cards.each do |card|
        @spoils_of_war.push(card)
      end
    elsif type == :mutally_assured_destruction
      3.times do
        @player1.deck.remove_card
      end
      3.times do
        @player2.deck.remove_card

      end
    end
  end

  def award_spoils(winner)
    card_czar = winner
    if card_czar.class == String
      return
    else
      @spoils_of_war.each do |spoil|
        card_czar.deck.cards.push(spoil)
      end
    end

  end
end
