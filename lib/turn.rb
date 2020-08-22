class Turn
  attr_reader :player1, :player2, :spoils_of_war, :turn_type, :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_type = nil
    @winner = nil
  end

  def both_cards_same_at(index)
    @player1.deck.rank_of_card_at(index) == @player2.deck.rank_of_card_at(index)
  end

  def type
    if both_cards_same_at(0) && both_cards_same_at(2)
      @turn_type = :mutually_assured_destruction
    elsif both_cards_same_at(0)
      @turn_type = :war
    else
      @turn_type = :basic
    end
  end

  def compare_cards_at(index)
    if @player1.deck.rank_of_card_at(index) > @player2.deck.rank_of_card_at(index)
      @winner = @player1
    else
      @winner = @player2
    end
  end

  def determine_winner
    if @turn_type == :basic
      compare_cards_at(0)
    elsif @turn_type == :war
      compare_cards_at(2)
    else
      @winner = "No Winner"
    end
  end

  def move_cards_to_spoils(number)
    number.times do
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    end
  end

  def pile_cards
    if @turn_type == :basic
      move_cards_to_spoils(1)
    elsif @turn_type == :war
      move_cards_to_spoils(3)
    else
      move_cards_to_spoils(3)
      @spoils_of_war.clear
    end
  end

  def award_spoils(recipient)
    @spoils_of_war.shuffle.each {|card| recipient.deck.add_card(card)}
    @spoils_of_war.clear
  end

  def display_type
    if @turn_type == :mutually_assured_destruction
      " *mutually assured destruction*"
    elsif @turn_type == :war
      " WAR -"
    else
      nil
    end
  end

  def show_cards_won
    if @turn_type == :mutually_assured_destruction
      "6 cards removed from play"
    else
      "#{@winner.name} won #{@spoils_of_war.count {|spoil| spoil.kind_of?(Card)} } cards"
    end
  end

end
