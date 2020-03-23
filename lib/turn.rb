
class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    # require 'pry';binding.pry
  end


  def type

    if player1.deck[0].rank == player2.deck[0].rank && player1.deck[2].rank == player2.deck[2].rank
      :mutually_assured_destruction
    elsif player1.deck[0].rank == player2.deck[0].rank
      :war
    else
      :basic
    end
  end


  def winner
    if type == :basic

      if player1.deck[0].rank > player2.deck[0].rank
        return player1
      else
        return player2
      end

    elsif type == :war

      if player1.deck[2].rank > player2.deck[2].rank
        return player1
      else
        return player2
      end

    else
        'No Winner'
    end
  end


  def pile_cards
    if type == :war
      @spoils_of_war << player1.deck[0..2]
      @spoils_of_war << player2.deck[0..2]
      @spoils_of_war.flatten!

    elsif type == :basic
      @spoils_of_war << player1.deck[0]
      @spoils_of_war << player2.deck[0]
      @spoils_of_war.flatten!

    else
      player1.deck.shift(3)
      player2.deck.shift(3)
    end

  end


  def spoils_of_war
    return @spoils_of_war
  end

  # def remove_played_cards_from_hand
  #   if type == :basic
  #     player1.deck.shift
  #     player2.deck.shift
  #   elsif type == :war
  #     player1.deck.shift(3)
  #     player2.deck.shift(3)
  #   end
  # end


  def award_spoils
    if type == :basic
     #require "pry"; binding.pry
      winner.deck << @spoils_of_war
    #  require "pry"; binding.pry
      winner.deck.flatten!
      player1.deck.shift
      player2.deck.shift
      #require "pry"; binding.pry
    elsif type == :war
      #require "pry"; binding.pry
      winner.deck << @spoils_of_war
    #  require "pry"; binding.pry
      winner.deck.flatten!
      player1.deck.shift(3)
      player2.deck.shift(3)
    end
    player1.deck
    player2.deck
  end

  def start
    p 'Welcome to War! (or Peace) This game will be played with 52 cards.
      The players today are Megan and Aurora.
      Type "GO" to start the game!
      ------------------------------------------------------------------'
    go = gets.chomp
    if go == 'GO'
      
    else
      p "Oops! Type 'GO' to start the game!"
    end
  end
end
