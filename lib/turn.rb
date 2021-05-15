require 'pry'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :award_winner, :type
  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @award_winner
  end

  def type
    #binding.pry
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @type = :basic
    elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      @type = :mutually_assured_destruction
    else
      @type = :war
    end
  end

  def winner
    #refactor to case statement
    #ternary operator
    if @type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @award_winner = player1
      else
        @award_winner = player2
      end

    elsif @type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @award_winner = player1
      else
        @award_winner = player2
      end

    else
      @award_winner = 'No Winner'
      return 'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      #send top card to spoils
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card
    elsif type == :war
      #send top 3 cards to spoils
      3.times {spoils_of_war << player1.deck.remove_card}
      3.times {spoils_of_war << player2.deck.remove_card}
    elsif type == :mutually_assured_destruction
      #remove three cards from each player's deck
      3.times {player1.deck.remove_card}
      3.times {player2.deck.remove_card}
    end
  end

  def award_spoils(winner)
    #binding.pry
    if type == :war || type == :basic
      @spoils_of_war.each do |card|
        winner.deck.add_card(card)
      end
    end
    @spoils_of_war = []
  end
  def start
    #code
    #binding.pry
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{player1.name} and #{player2.name}"
    puts "Type 'GO' to start the game"
    puts "---------------------------------------------------------------"
    play_game = gets.chomp
    if play_game == 'GO' || play_game == 'go'
      #binding.pry
      loop_count = 0

        loop do
          if player1.has_lost? == false && player2.has_lost? == false
            self.type
            self.winner
            self.pile_cards
            loop_count +=1
            if @type == :mutually_assured_destruction
              puts "Turn #{loop_count}: *#{@type}* 6 cards removed from play"
            else
              puts "Turn #{loop_count}: #{@type}, #{@award_winner.name} won #{@spoils_of_war.length} cards"
            end
            self.award_spoils(@award_winner)
            @player1.deck.shuffle
            @player2.deck.shuffle
            if loop_count == 1000000
              puts '---- DRAW ----'
              break
            elsif player1.has_lost? == true
              puts "#{player1.name} has lost. #{player2.name} is the winner!"
              break
            elsif player2.has_lost? == true
              puts "#{player2.name} has lost. #{player1.name} is the winner!"
              break
            end
          end
        end
      end
  end
end
