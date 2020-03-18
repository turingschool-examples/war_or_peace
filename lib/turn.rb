class Turn

  attr_reader :player1, :player2, :spoils_of_war, :game_over, :start_game

  def initialize(player1, player2, spoils_of_war = [])
    @player1 = player1
    @player2 = player2
    @spoils_of_war = spoils_of_war
    @game_over = false
    @start_game = false
  end

  def type
    if @player1.deck.cards.length >= 3 && @player2.deck.cards.length <= 3
      @game_over = true
      "#{@player2} WINS"
    elsif @player2.deck.cards.length >= 3 && @player1.deck.cards.length <= 3
      @game_over = true
      "#{@player1} WINS"
    elsif @player2.deck.cards.length <= 3 && @player1.deck.cards.length <= 3
      @game_over = true
      "DRAW"
    elsif @player1.deck.rank_of_card_at(0) !=
      @player2.deck.rank_of_card_at(0)
      :basic
    elsif (@player1.deck.rank_of_card_at(0) ==
      @player2.deck.rank_of_card_at(0)) &&
      (@player1.deck.rank_of_card_at(2) !=
      @player2.deck.rank_of_card_at(2))
      :war
    elsif (@player1.deck.rank_of_card_at(0) ==
      @player2.deck.rank_of_card_at(0)) &&
      (@player1.deck.rank_of_card_at(2) ==
      @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    end
  end

  def winner
    # convert type return value from a symbol to a string
    if type.to_s == "basic"
      # if player 1 has a higher top card they win, vise versa
      if @player1.deck.rank_of_card_at(0) >
        @player2.deck.rank_of_card_at(0)
      @player1
      elsif @player2.deck.rank_of_card_at(0) >
      @player1.deck.rank_of_card_at(0)
        @player2
      end
    elsif type.to_s == "war"
      # if player 1 has a higher card 2 then they win, vise versa
      if @player1.deck.rank_of_card_at(2) >
        @player2.deck.rank_of_card_at(2)
        @player1
      elsif @player2.deck.rank_of_card_at(2) >
        @player1.deck.rank_of_card_at(2)
        @player2
      end
      # if its destruction there is no winner
    elsif type.to_s == "mutually_assured_destruction"
      'No Winner'
    end
  end

  def pile_cards
    # spoils pile
    @spoils_of_war = []
    # convert type return value from a symbol to a string
    if type.to_s == "basic"
      # add top cards to spoils of war
      @spoils_of_war.push(@player1.deck.cards[0])
      @spoils_of_war.push(@player2.deck.cards[0])
      # remove cards that have been played
      @player1.deck.remove_card
      @player2.deck.remove_card
      @spoils_of_war = spoils_of_war
      return
    elsif type.to_s == "war"
      # add top 3 cards to spoils of war
      @spoils_of_war.push(@player1.deck.cards[2])
      @spoils_of_war.push(@player1.deck.cards[1])
      @spoils_of_war.push(@player1.deck.cards[0])
      @spoils_of_war.push(@player2.deck.cards[2])
      @spoils_of_war.push(@player2.deck.cards[1])
      @spoils_of_war.push(@player2.deck.cards[0])
      # @spoils_of_war.push(@player1.deck.cards[0..2])
      # @spoils_of_war.push(@player2.deck.cards[0..2])
      # remove top 3 cards
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
      @spoils_of_war = @spoils_of_war
      return
    elsif  type.to_s == "mutually_assured_destruction"
      # remove top 3 cards
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player1.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
      @player2.deck.remove_card
      return
    end
  end

  def award_spoils(winner)
    # if winner == @player1
    #   @spoils_of_war.each do |card|
    #     @player1.deck.add_card(card)
    #   end
    # elsif winner == @player2
    #   @spoils_of_war.each do |card|
    #     @player2.deck.add_card(card)
    #   end
    # end
    if type.to_s == "basic"
      if winner == @player1

       @player1.deck.add_card(@spoils_of_war[0])
       @player1.deck.add_card(@spoils_of_war[0])
        return
      elsif winner == @player2
        @spoils_of_war.each do |card|
          @player2.deck.add_card(card)
        end
        # @player2.deck.add_card(@spoils_of_war[0])
        # @player2.deck.add_card(@spoils_of_war[0])
        return
      end
    end
    if type.to_s == "war"
      if winner == @player1
        @player1.deck.add_card(@spoils_of_war[0])
        @player1.deck.add_card(@spoils_of_war[0])
        @player1.deck.add_card(@spoils_of_war[0])
        @player1.deck.add_card(@spoils_of_war[0])
        @player1.deck.add_card(@spoils_of_war[0])
        @player1.deck.add_card(@spoils_of_war[0])
        return
      elsif winner == @player2
        @player2.deck.add_card(@spoils_of_war[0])
        @player2.deck.add_card(@spoils_of_war[0])
        @player2.deck.add_card(@spoils_of_war[0])
        @player2.deck.add_card(@spoils_of_war[0])
        @player2.deck.add_card(@spoils_of_war[0])
        @player2.deck.add_card(@spoils_of_war[0])
        return
      end
    end
    #@player1.deck.cards.flatten
    #@player2.deck.cards.flatten

  end

  def start
    @start_game = true
    # puts "Welcome to War! (or Peace) This game will be played with 52 cards.
    # The players today are #{@player1} and #{@player2}.
    # Type 'GO' to start the game!
    # ------------------------------------------------------------------------"
    # input = gets.chomp
    # if input == 'go' || input == 'Go' ||input == 'GO'
    #   puts "WE DID IT"
    #   @start_game = true
    # else
    #   puts "Invalid input"
    # end

  end

end
