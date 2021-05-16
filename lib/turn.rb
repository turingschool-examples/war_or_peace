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
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @type = :basic
    elsif (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)) && (player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      @type = :mutually_assured_destruction
    else
      @type = :war
    end
  end

  def winner
    case @type
    when :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        @award_winner = player1
      else
        @award_winner = player2
      end

    when :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        @award_winner = player1
      else
        @award_winner = player2
      end

    when :mutually_assured_destruction
      @award_winner = 'No Winner'
      return 'No Winner'
    end
  end

  def pile_cards
    case @type
    when :basic
      spoils_of_war << player1.deck.remove_card
      spoils_of_war << player2.deck.remove_card

    when :war
      3.times {spoils_of_war << player1.deck.remove_card}
      3.times {spoils_of_war << player2.deck.remove_card}

    when :mutually_assured_destruction
      3.times {player1.deck.remove_card}
      3.times {player2.deck.remove_card}
    end
  end

  def award_spoils(winner)
    if type == :war || type == :basic
      @spoils_of_war.each do |card|
        winner.deck.add_card(card)
      end
    end
    @spoils_of_war = []
  end

  def start
    puts 'Welcome to War! (or Peace) This game will be played with 52 cards.'
    puts "The players today are #{player1.name} and #{player2.name}"
    puts "Type 'GO' to start the game"
    puts "---------------------------------------------------------------"
    play_game = gets.chomp
    if play_game == 'GO' || play_game == 'go'
      loop_count = 0
        loop do
          self.type
          self.winner
          self.pile_cards
          loop_count +=1
          if @type == :mutually_assured_destruction
              puts "Turn #{loop_count}: ***#{@type}*** 6 cards removed from play"
          else
              puts "Turn #{loop_count}: *#{@type}* #{@award_winner.name} won #{@spoils_of_war.length} cards"
          end
          self.award_spoils(@award_winner)
          #to make the game a little more interesting uncomment lines 89 & 90
          #@player1.deck.shuffle
          #@player2.deck.shuffle
          if loop_count == 1000000
            puts '---- DRAW ----'
            break

          elsif @player1.has_lost? == true || @player1.deck.cards.length < 3
            puts "#{@player1.name} has lost. #{@player2.name} is the winner!"
            break

          elsif @player2.has_lost? == true || @player2.deck.cards.length < 3
            puts "#{@player2.name} has lost. #{@player1.name} is the winner!"
            break
          end
        end
    else
      puts "Okay then... we'll play later."
    end
  end
end
