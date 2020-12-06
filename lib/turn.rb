class Turn

  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :turn_winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_winner = winner
  end

  # handle messy rank-fetching for type determination
  def rank_test(index)
    @player1.deck.rank_of_card_at(index) == @player2.deck.rank_of_card_at(index)
  end

  # get turn type using helper method
  def type
    if rank_test(0) && rank_test(2)
      :mutually_assured_destruction
    elsif rank_test(0)
      :war
    else
      :basic
    end
  end

  # get player card rank at specified index
  def get_rank(player, index)
    player.deck.rank_of_card_at(index)
  end

  # compare card ranks at specific indexes to determine winner
  def winner
    if type == :basic
      if get_rank(@player1, 0) > get_rank(@player2, 0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if get_rank(@player1, 2) > get_rank(@player2, 2)
        @player1
      else
        @player2
      end
    elsif type == :mutually_assured_destruction
      'No Winner'
    end
  end

  # collect forfeited cards for reassignment, remove same from player decks
  def pile_cards
    players = [@player1, @player2]
    if type == :basic
      players.each do |player|
        @spoils_of_war << player.deck.cards[0]
        player.deck.remove_card
      end
    elsif type == :war
      players.each do |player|
        @spoils_of_war << player.deck.cards[0..2]
        3.times do
          player.deck.remove_card
        end
        @spoils_of_war = @spoils_of_war.flatten
      end
    elsif type == :mutually_assured_destruction
      players.each do |player|
        3.times do
          player.deck.remove_card
        end
      end
      # replace 'No Winner' with nil so it can be tested in award_spoils
      @turn_winner = nil
    end
  end

  # 'unless type == :mutually_assured_destruction' just wouldn't work for this
  def award_spoils
    if @turn_winner
      @turn_winner.deck.cards << @spoils_of_war
      @turn_winner.deck.cards = @turn_winner.deck.cards.flatten
    end
  end
end
