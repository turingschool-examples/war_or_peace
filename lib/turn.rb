require './lib/deck'
require './lib/card'
require './lib/player'

class Turn
attr_reader :player1, :player2, :spoils_of_war, :type, :victor

  def initialize(player1_param, player2_param)
    @player1 = player1_param
    @player2 = player2_param
    @spoils_of_war = []
  end

  def start
    until @starter == "GO"
      p "Type 'GO' to start the game!"
      p "--------------------------------------------------------------------"
      p ">"
      @starter = gets.chomp.upcase
    end
  end

  def conditional_setup
    @equal_condition1 = @player1.deck.rank_of_card_at(0) ==  @player2.deck.rank_of_card_at(0)
    @equal_condition2 = @player1.deck.rank_of_card_at(2) ==  @player2.deck.rank_of_card_at(2)
    @p1_nil_condition2 = (@player1.deck.cards[2] == nil)
    @p2_nil_condition2 = (@player2.deck.cards[2] == nil)
    @p1_nil_deck = @player1.deck == []
    @p2_nil_deck = @player2.deck == []
  end

  def type_no_win

    conditional_setup

    if (@equal_condition1 && @equal_condition2)
      :mutually_assured_destruction
    elsif @equal_condition1
      :war
    elsif @equal_condition1 && ( @p1_nil_condition2 || @p2_nil_condition1)
      puts "Player #{winner} Wins the Game!"
    else :basic
    end
  end

  def type
    conditional_setup

    if @p1_nil_deck || @p2_nil_deck
      puts "Player #{winner} Wins the Game!"
    else type_no_win
    end
  end



  def card_comparitor (index)
    if player1.deck.rank_of_card_at(index) > player2.deck.rank_of_card_at(index)
      player1
    else player2
    end
  end

  def winner
    if type == :war
      card_comparitor(2)
    elsif type == :mutually_assured_destruction
      puts "No Winner"
      return nil
    else card_comparitor(0)
    end
  end


  def pile_cards

    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card


    elsif type == :war
        3.times {@spoils_of_war << @player1.deck.remove_card}
        3.times {@spoils_of_war << @player2.deck.remove_card}

    else
      3.times {@player1.deck.cards.delete_at(0)}
      3.times {@player2.deck.cards.delete_at(0)}
    end

  end

  def award_spoils(victor_param)
    @victor = victor_param
    @victor.deck.cards.concat(@spoils_of_war)
    @spoils_of_war = []
  end


end
