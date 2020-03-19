require 'pry'
class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end
##################################################
  def type
    #less than 3 cards player1
    if @player1.deck.cards.length < 3 && @player2.deck.cards.length > 3
      if  @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)

        @player1_forfeit = true
        :war
        return
      end
    end
    #less than 3 cards player 2
    if @player1.deck.cards.length > 3 && @player2.deck.cards.length < 3
      if  @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)

        @player2_forfeit = true
        :war
        return
      end
    end

    # both less than 3 cards
    if @player1.deck.cards.length < 3 && @player2.deck.cards.length < 3
      if  @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)

        :war
        @draw = true
        #binding.pry
        return
      end
    end


    #normal play
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
##################################################
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
##################################################
  def award_spoils
    if @spoils_of_war.length > 0
    #binding.pry
      @spoils_of_war.each do |card|
        @turn_winner.deck.cards << card
      end
    end
  end
##################################################
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
        if @player1.has_lost?
          puts "Turn num #{turn_num}"
          puts "~*~*~*~*~*#{@player2.name} has won!~*~*~*~*~*"
          puts "p1 cards: #{@player1.deck.cards.length} v p2 cards: #{@player2.deck.cards.length}"
          break
        elsif @player2.has_lost?
          puts "Turn num #{turn_num}"
          puts "~*~*~*~*~*#{@player1.name} has won!~*~*~*~*~*"
          puts "p1 cards: #{@player1.deck.cards.length} v p2 cards: #{@player2.deck.cards.length}"
          break
        end
        #puts "p1: #{@player1.deck.cards.length}"
        #puts "p2: #{@player2.deck.cards.length}"
      #  puts "#{@player1.deck.rank_of_card_at(0)} v #{@player2.deck.rank_of_card_at(0)} #{type}"
        type
        if @player1_forfeit
          puts "Turn num #{turn_num} #{type}"
          puts "#{@player1.deck.cards[0].rank} #{@player1.deck.cards[0].suit} v #{@player1.deck.cards[0].rank} #{@player1.deck.cards[0].suit}"
          puts "#{@player1.deck.cards[1].rank} #{@player1.deck.cards[1].suit} v #{@player1.deck.cards[1].rank} #{@player1.deck.cards[1].suit}"
          puts puts "~*~*~*~*~*#{@player1.name} has forfieted!~*~*~*~*~*"
          puts "p1 cards: #{@player1.deck.cards.length} v p2 cards: #{@player2.deck.cards.length}"
          break
        end
        if @player2_forfeit
          puts "Turn num #{turn_num} #{type}"
          puts "#{@player1.deck.cards[0].rank} #{@player1.deck.cards[0].suit} v #{@player1.deck.cards[0].rank} #{@player1.deck.cards[0].suit}"
          puts "#{@player1.deck.cards[1].rank} #{@player1.deck.cards[1].suit} v #{@player1.deck.cards[1].rank} #{@player1.deck.cards[1].suit}"
          puts puts "~*~*~*~*~*#{@player2.name} has forfeited!~*~*~*~*~*"
          puts "p1 cards: #{@player1.deck.cards.length} v p2 cards: #{@player2.deck.cards.length}"
          break
        end
        if @draw
            puts "Turn num #{turn_num}"
            puts puts "~*~*~*~*~*Draw!~*~*~*~*~*"
            puts "p1 cards: #{@player1.deck.cards.length} v p2 cards: #{@player2.deck.cards.length}"
            break
        end



        winner
        pile_cards
        award_spoils
        turn_num += 1
        if turn_num > 1000000
          puts "Turns Maxed out #{turn_num}"
          break
        end

        #puts "Turn num #{turn_num}"


        # if type.to_s == "mutually_assured_destruction"
        #  puts "MAD"
        #  break
        # elsif type.to_s == "war"
        #  puts "WAR"
        #  break
        # end
    end
  end


end
