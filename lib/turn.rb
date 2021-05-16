require './lib/player'
require './lib/deck'

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    @player1_c1 = @player1.deck.rank_of_card_at(0)
    @player2_c1 = @player2.deck.rank_of_card_at(0)
    @p1ayer1_c2 = @player1.deck.rank_of_card_at(2)
    @player2_c2 = @player2.deck.rank_of_card_at(2)

    if @player1_c1 != @player2_c1
      @type = :basic
    elsif @p1ayer1_c2 != @player2_c2
      @type = :war
    elsif @p1ayer1_c2 == @player2_c2
      @type = :mutually_assured_destruction
    end
    @type
  end

  def winner
    if self.type == :basic
      result = @player1_c1 > @player2_c1
    elsif self.type == :war
      result = @p1ayer1_c2 > @player2_c2
    else self.type == :mutually_assured_destruction
      result = nil
    end

    if result == true
      @player1
    elsif result == false
      @player2
    else
      'No Winner'
    end
  end

  def pile_cards
    if self.type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card

    elsif self.type == :war
      3.times do
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      end

    elsif self.type == :mutually_assured_destruction
      3.times do
      @player1.deck.remove_card
      @player2.deck.remove_card
      end
    end
  end

  def award_spoils(winner)
    if winner == @player1
      @spoils_of_war.each do |spoil|
        @player1.deck.add_card(spoil)
      end
    elsif winner == @player2
      @spoils_of_war.each do |spoil|
        @player2.deck.add_card(spoil)
      end
    end
    @spoils_of_war = []
  end

  def start
    print 'Welcome to War! (or Peace) '
    puts 'This game will be played with 52 cards.'
    puts "The players today are #{@player1.name} and #{@player2.name}."
    puts 'Type \'GO\' to start the game!'
    puts '-' * 65
    starter = gets.chomp
    turn = 0

    if starter == 'GO' || starter == 'go' || starter == 'Go'

      while @player1.deck.cards.length >= 3 &&  @player2.deck.cards.length >= 3
        turn = turn + 1
        if self.type == :basic && turn <= 1000000
          puts "Turn #{turn}: #{self.winner.name} won 2 cards"

        elsif self.type == :war && turn <= 1000000
          puts "Turn #{turn}: WAR - #{self.winner.name} won 6 cards"

        elsif self.type == :mutually_assured_destruction && turn <= 1000000
          print "Turn #{turn}: *mutually assured "
          puts 'destruction* 6 cards removed from play'

        elsif turn > 1000000
          puts '*~*~*~* DRAW *~*~*~*'
          puts "#{@player1.name} and #{@player2.name} end their war with peace"
          break
        end

        win = self.winner
        self.pile_cards
        self.award_spoils(win)
      end

      if @player1.deck.cards.length >= 3 && turn < 1000000
        puts "*~*~*~* #{@player1.name} has won the game! *~*~*~*"

      elsif @player2.deck.cards.length >= 3 && turn < 1000000
        puts "*~*~*~* #{@player2.name} has won the game! *~*~*~*"
      end

    else
      puts 'Invalid input'
    end
  end
end
