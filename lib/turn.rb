class Turn
  attr_reader :player_one, :player_two, :spoils_of_war, :turn_type, :turn_winner
  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @spoils_of_war = []
    @turn_type = nil
    @turn_winner = nil
  end

  # Determine turn type. :loss turn_type will cover edge case wherein MAD turn is triggered 
  # and one player has insufficient cards to complete it.
  def type
    if @player_one.deck.rank_of_card_at(0) != @player_two.deck.rank_of_card_at(0)
      @turn_type = :basic
    elsif @player_one.deck.rank_of_card_at(0) == @player_two.deck.rank_of_card_at(0) && @player_one.deck.card_list.length < 3 || @player_two.deck.card_list.length < 3
      @turn_type = :loss
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

  # The shuffle! on line 66 will change all the award_spoils tests.
  # Added as most games devolved into tit-for-tat as soon as two aces 
  # were passed seporated by one low card.
  # Changed turn_spec.rb:125, 126, & 221 to match
  def award_spoils
    if @turn_type == :war || @turn_type == :basic
    @turn_winner.deck.card_list << spoils_of_war.shuffle!
    @spoils_of_war = []
    @turn_winner.deck.card_list.flatten!
    # @turn_winner = nil. No need. Each turn is an instence no need for nil. Still wrapping my head around this interaction.
    end
  end
end