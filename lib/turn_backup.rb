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

    if @player1.deck.cards == [] || @player2.deck.cards == []
      @game_over = true
    elsif @player1.deck.cards != [] || @player2.deck.cards != []
      if @player1.deck.rank_of_card_at(0) !=
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
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      # remove cards that have been played
      @player1.deck.remove_card
      @player2.deck.remove_card
      @spoils_of_war = spoils_of_war

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
      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}
      # @player1.deck.remove_card
      # @player1.deck.remove_card
      # @player1.deck.remove_card
      # @player2.deck.remove_card
      # @player2.deck.remove_card
      # @player2.deck.remove_card
      @spoils_of_war = spoils_of_war

    elsif  type.to_s == "mutually_assured_destruction"
      # remove top 3 cards
      3.times {@player1.deck.remove_card}
      3.times {@player2.deck.remove_card}
      # @player1.deck.remove_card
      # @player1.deck.remove_card
      # @player1.deck.remove_card
      # @player2.deck.remove_card
      # @player2.deck.remove_card
      # @player2.deck.remove_card

    end
    if @player2.deck.cards == [] && @player1.deck.cards == []
      @game_over = true
      "DRAW"
    elsif @player1.deck.cards == []
      @game_over = true
      "#{player2} Wins"
    elsif @player2.deck.cards == []
      @game_over = true
      "#{player1} Wins"
    end

    # if @player1.deck.cards.length > 0 && @player2.deck.cards.length == 0
    #   @game_over = true
    #   "#{@player2} WINS"
    # elsif @player2.deck.cards.length > 0 && @player1.deck.cards.length == 0
    #   @game_over = true
    #   "#{@player1} WINS"
    # elsif @player2.deck.cards.length == 0 && @player1.deck.cards.length == 0
    #   @game_over = true
    #   "DRAW"
    # end
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
        @spoils_of_war.each do |card|
          @player1.deck.add_card(card)
        end
       # @player1.deck.add_card(@spoils_of_war[0])
       # @player1.deck.add_card(@spoils_of_war[1])
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

        @spoils_of_war.each do |card|
          @player1.deck.add_card(card)
        end

        return
      elsif winner == @player2

        @spoils_of_war.each do |card|
          @player2.deck.add_card(card)
        end

        return
      end
    end


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

######## NEW TURN doesnt account for 3 or less cards
require 'pry'
class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    #basic
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
    #  binding.pry
      :basic
    elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) &&
      (@player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    end
  end

  def winner
    type_string = type.to_s
    if type_string == "basic"
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @turn_winner = @player1
      elsif  @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        @turn_winner = @player2
      end

    elsif type_string == "war"
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @turn_winner = @player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @turn_winner = @player2
      end
    elsif type_string == "mutually_assured_destruction"
      "No Winner"
    end
  end

  def pile_cards
    @spoils_of_war = []
    type_string = type.to_s
    if type_string == "basic"
      # add to spoils
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      # delete spoils cards
      @player1.deck.remove_card
      @player2.deck.remove_card
    end

    if type_string == "mutually_assured_destruction" || type_string == "war"
      #player 1 add to spoils
      index = 0
      3.times do
        if @player1.deck.cards == []
          break
        end
        @spoils_of_war << @player1.deck.cards[index]
        index += 1
      end
      #player 2 add to spoils
      index = 0
      3.times do
        if @player2.deck.cards == []
          break
        end
        @spoils_of_war << @player2.deck.cards[index]
        index += 1
      end
      #player1 remove cards
      index = 0
      3.times do
        if @player1.deck.cards == []
          break
        end
        @player1.deck.remove_card
      end
      #player2 remove cards
      index = 0
      3.times do
        if @player2.deck.cards == []
          break
        end
        @player2.deck.remove_card
      end
    end

    if type_string == "mutually_assured_destruction"
      @spoils_of_war = []
    end
  end

  def award_spoils
    if @spoils_of_war.length > 0
    #binding.pry
      @spoils_of_war.each do |card|
        @turn_winner.deck.cards << card
      end
    end
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

    turn_num = 1
      loop do
        #puts "p1: #{@player1.deck.cards.length}"
        #puts "p2: #{@player2.deck.cards.length}"
        #puts "#{@player1.deck.rank_of_card_at(0)} v #{@player2.deck.rank_of_card_at(0)} #{type}"
        type
        winner
        pile_cards
        award_spoils
        turn_num += 1
        if turn_num > 1000000
          puts "Turns Maxed out #{turn_num}"
          break
        end

        #puts "Turn num #{turn_num}"
      if @player1.has_lost?
        puts "Turn num #{turn_num}"
        puts "~*~*~*~*~*#{@player2.name} has won!~*~*~*~*"
        break
      elsif @player2.has_lost?
        puts "Turn num #{turn_num}"
        puts "~*~*~*~*~*#{@player1.name} has won!~*~*~*~*"
        break
      end

      # if type.to_s == "mutually_assured_destruction"
      #   puts "MAD"
      #   break
      # elsif type.to_s == "war"
      #   puts "WAR"
      #   break
      # end
    end
  end


end
