#'./lib/turn.rb'
require './lib/card'
require './lib/deck'
require './lib/player'

class Turn

  attr_reader :player1, :player2
  def initialize (player1, player2)

    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end

  def type

#     puts " player1 cards =#{@player1.deck.cards.length}"
#     puts " player2 cards =#{@player2.deck.cards.length}"
      player1_card = @player1.deck.rank_of_card_at(0)
      player2_card = @player2.deck.rank_of_card_at(0)

      if @player1.deck.cards.length < 3 || @player2.deck.cards.length < 3
        return :basic

      elsif player1_card != player2_card
        return :basic

      elsif (player1_card == player2_card) &&
            (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
        return :mutually_assured_destruction

      elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
        return :war
      end
  end

  def spoils_of_war
    return @spoils_of_war
  end
  ###
  #Method to determin the winner of the Turn
  ###
  def winner
    if type == :basic

      #Player1 first card is higher than Player2 first card
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        return @player1
      else
        return @player2
      end

    elsif type == :mutually_assured_destruction
      #Players cards are the same in 1st and 3rd spot
      return "No Winner"

    elsif type == :war
      #Player1 third card is higher than Player2 third card
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        return @player1
      else
        return @player2
      end
    end

  end

  ###
  #Method which adds/removes cards from winner/loser player deck
  ###
  def pile_cards

    if type == :basic


      #put first card of each player onto spoils_of_war
      @spoils_of_war.push( @player1.deck.cards[0] )
      @spoils_of_war.push( @player2.deck.cards[0] )

      #remove first card in each players deck
      @player1.deck.remove_card
      @player2.deck.remove_card

    elsif type == :mutually_assured_destruction
#      puts "in plie_cards #{type}"

      # remove top 3 cards from each players deck
      3.times {
        @player1.deck.remove_card
        @player2.deck.remove_card
#        @player2.deck.cards.shift
      }

    elsif type == :war
#     puts "in plie_cards #{type}"
#     puts " player1 cards =#{@player1.deck.cards.length}"
#     puts " player2 cards =#{@player2.deck.cards.length}"

      #put first 3 cards of each player onto spoils_of_war
      3.times {
      @spoils_of_war.push( @player1.deck.cards[0] )
      @spoils_of_war.push( @player2.deck.cards[0] )

      #remove first 3 cards in each players deck
      @player1.deck.remove_card
      @player2.deck.remove_card
      }
    end
  end

  def award_spoils (winner)
#      puts "In award_spoils #{winner.name}"
#      puts "#{winner.name} cards are #{winner.deck.cards.length}"
#puts "spoils cards #{@spoils_of_war}"
      #give cards to winning players deck
      @spoils_of_war.each do |card|
      winner.deck.add_card(card)
      end
#      puts "#{winner.name} cards are #{winner.deck.cards.length}"
#      binding.pry
      #empty spoils_of_war array for next use
      @spoils_of_war = []

  end

end
