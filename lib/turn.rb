class Turn
  attr_reader :player1, :player2, :spoils_of_war


  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end

  def type
    if @player1.deck.cards.length < 3 || @player2.deck.cards.length < 3
      return :basic
    #   # && @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
    #   # && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return :war
    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      return :basic
    else
      return :basic

    end
  end

  def winner
    if self.type == :basic && @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
       @player1
    elsif self.type == :basic && @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2
    # elsif self.type == :basic
    #   @player1
    elsif self.type == :war && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
       @player1
    elsif self.type == :war && @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
       @player2
     elsif self.type == :war && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      "Try this again"
    elsif self.type == :mutually_assured_destruction
      "No Winner, No Winner, No Chicken Dinner"
    else
      "#{@player1.name} wins by default because I don't know what this edge case could logically be"
    end
  end

  def pile_cards
    # require 'pry'; binding.pry
    if self.type == :basic
       spoils_of_war << player1.deck.remove_card
       spoils_of_war << player2.deck.remove_card
    elsif self.type == :war
      3.times do
        spoils_of_war << player1.deck.remove_card
        spoils_of_war << player2.deck.remove_card
      end
    elsif self.type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    else
      p "edge case again"
    end
  end

  def award_spoils(winner)
    if spoils_of_war.size > 0
      spoils_of_war.each do
        winner.deck.cards << spoils_of_war.shift
      end
    end
  end

  def start
    p "Welcome to War! (or Peace)"
    p "This game will be played with 52 cards. The players today are #{@player1.name} and #{@player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"

    input = gets.chomp.upcase
    if input != 'GO'
      p "It's two letters how did you mess that up?"
      p "Let's try that again."
      p self.start
    elsif input == 'GO'
      loop_counter = 0
      loop do
        loop_counter += 1
        # p loop_counter

        self.pile_cards
        turn_winner = self.winner

        if turn_winner.class == String
          p turn_winner
        else
          self.award_spoils(turn_winner)
        end
        if self.type == :basic
          p "#{self.winner.name} won 2 cards"
        elsif self.type == :war
          p "#{self.winner.name} won 6 cards"
        elsif self.type == :mutually_assured_destruction
          p "*MUTUALLY ASSURED DESCRUCTION* 6 cards were removed from play"
        end
        #cant figure out edge case, changed rules to assign Winner
        #if either player gets below 3
        if player1.deck.cards.length < 3 || player2.deck.cards.length < 3
          p "*~*~*~* #{self.winner.name} won the game!*~*~*~* "
          break
        end
        if loop_counter == 1000000
            p "----  DRAW ----"
            break
        end
      end
    end
  end
end
