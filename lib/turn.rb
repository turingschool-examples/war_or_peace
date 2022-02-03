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

    player1_card = @player1.deck.rank_of_card_at(0)
    player2_card = @player2.deck.rank_of_card_at(0)

    if player1_card != player2_card
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

  def winner
    if type == :basic

      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        puts "player1 wins "
        return @player1
      else puts "player2 wins"
        return @player2
      end

    elsif type == :mutually_assured_destruction
      return "No Winner"

    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        puts "player1 wins "
        return @player1
      else
        puts "player2 wins"
        return @player2
      end
    end

  end

  def pile_cards

    if type == :basic
      puts "in plie_cards #{type}"
      #put first card of each player onto spoils_of_war
      @spoils_of_war.push( @player1.deck.cards[0] )
      @spoils_of_war.push( @player2.deck.cards[0] )

      #remove first card in each players deck
      @player1.deck.cards.shift
      @player2.deck.cards.shift

#      @spoils_of_war.deck.add_card(@player1.deck.card[0])
#      @spoils_of_war.deck.add_card(@player2.deck.card[0])

    elsif type == :mutually_assured_destruction
      puts "in plie_cards #{type}"

      # remove top 3 cards from each players deck
      3.times {
        @player1.deck.cards.shift
        @player2.deck.cards.shift
      }

    elsif type == :war
      puts "in plie_cards #{type}"
      #put first 3 cards of each player onto spoils_of_war
      3.times {
      @spoils_of_war.push( @player1.deck.cards[0] )
      @spoils_of_war.push( @player2.deck.cards[0] )

      #remove first 3 cards in each players deck
      @player1.deck.cards.shift
      @player2.deck.cards.shift
      }
    end

  end

  def award_spoils (winner)
      puts "In award_spoils #{winner.name}"
      puts "#{winner.name} cards are #{winner.deck.cards}"
      #give cards to winning players deck
      winner.deck.add_card(@spoils_of_war)
  end

end
