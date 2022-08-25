class Turn
  attr_reader :player_one, :player_two, :spoils_of_war
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @spoils_of_war = []
    @turn_type = nil
  end

  def type
    if @player_one.deck.rank_of_card_at(0) != @player_two.deck.rank_of_card_at(0)
      @turn_type = :basic
    elsif @player_one.deck.rank_of_card_at(0) == @player_two.deck.rank_of_card_at(0) && @player_one.deck.rank_of_card_at(2) == @player_two.deck.rank_of_card_at(2)
      @turn_type = :mutually_assured_destruction
    elsif @player_one.deck.rank_of_card_at(0) == @player_two.deck.rank_of_card_at(0)
      @turn_type = :war
    end
  end
  
  def winner
    if @turn_type == :basic
      if @player_one.deck.rank_of_card_at(0) > @player_two.deck.rank_of_card_at(0)
        @turn_winner = @player_one
      elsif @player_one.deck.rank_of_card_at(0) < @player_two.deck.rank_of_card_at(0)
        @turn_winner = @player_two
      end
    elsif @turn_type == :war
      if @player_one.deck.rank_of_card_at(2) > @player_two.deck.rank_of_card_at(2)
        @turn_winner = @player_one
      elsif @player_one.deck.rank_of_card_at(2) < @player_two.deck.rank_of_card_at(2)
        @turn_winner = @player_two
      end
    elsif @turn_type == :mutually_assured_destruction
      @turn_winner = 'No Winner'
    end
  end

  def pile_cards
    if @turn_type == :basic
      #spoils_of_war << @player_one.deck.remove_card ?
      spoils_of_war << @player_one.deck.card_list[0]
      @player_one.deck.card_list.delete_at(0)

      spoils_of_war << @player_two.deck.card_list[0]
      @player_two.deck.card_list.delete_at(0)
    elsif @turn_type == :war
      spoils_of_war << @player_one.deck.card_list[0..2]
      @player_one.deck.card_list.slice!(0, 3)
    
      spoils_of_war << @player_two.deck.card_list[0..2]
      @player_two.deck.card_list.slice!(0, 3)
      @spoils_of_war.flatten!
    elsif @turn_type == :mutually_assured_destruction
      @player_one.deck.card_list.slice!(0, 3)
      @player_two.deck.card_list.slice!(0, 3)
    end
  end

  def award_spoils
    @turn_winner.deck.card_list << spoils_of_war
    spoils_of_war = []
    @turn_winner.deck.card_list.flatten!
    @turn_winner = nil
    # each turn is an instence no need for nil
  end
end

