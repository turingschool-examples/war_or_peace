require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type, :award_winner
  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @award_winner
  end

  def type
    #binding.pry
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      type = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && player2.deck.rank_of_card_at(2) == player1.deck.rank_of_card_at(2)
      type = :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      type = :war
    end
  end

  def winner
    #refactor to case statement
    #ternary operator
    if type == :basic
      #array = [player1.deck.rank_of_card_at(0), player2.deck.rank_of_card_at(0)]
      #binding.pry
      #array.max
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @award_winner = player1
      else
        @award_winner = player2
      end

    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @award_winner = player1
      else
        @award_winner = player2
      end

    elsif type == :mutually_assured_destruction
      return 'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      #send top card to spoils
      spoils_of_war << player1.deck.cards.shift
      spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      #send top 3 cards to spoils
      3.times {spoils_of_war << player1.deck.remove_card}
      3.times {spoils_of_war << player2.deck.remove_card}
    else
      #remove three cards from each player's deck
      3.times {player1.deck.remove_card}
      3.times {player2.deck.remove_card}
    end
  end

  def award_spoils(winner)
    #binding.pry
    spoils_of_war.each do |card|
      winner.deck.add_card(card)
    end
  end
  def start
    #code
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{player1.name} and #{player2.name}"
    puts "Type 'GO' to start the game"
    puts "---------------------------------------------------------------"
  end
end
