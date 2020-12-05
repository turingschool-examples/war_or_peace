class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if mutually_assured_destruction?
      :mutually_assured_destruction
    elsif war?
      :war
    elsif basic?
      :basic
    else
      # ??
    end
  end

  def winner
    @winner ||= calculate_winner
  end

  def cards_used
    @spoils_of_war.length
  end

  def pile_cards
    # Move cards FROM players decks TO spoils_of_war (...or the void)

    if type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.cards.shift
        @spoils_of_war << @player2.deck.cards.shift
      end
    elsif type == :mutually_assured_destruction
      3.times do
        @player1.deck.cards.shift
        @player2.deck.cards.shift
      end
    else
      # ??
    end
  end

  def award_spoils(winning_player)
    if winning_player.instance_of? Player
      @spoils_of_war.each do |card|
        winning_player.deck.add_card(card)
      end
    end
  end

  private

  def basic?
    @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
  end

  def war?
    @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
  end

  def mutually_assured_destruction?
    if @player1.deck.cards.length > 2 && @player2.deck.cards.length > 2
      @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    else
      false
    end
  end

  def player_with_highest_card_at(index)
    player1_card_rank = @player1.deck.rank_of_card_at(index)
    player2_card_rank = @player2.deck.rank_of_card_at(index)

    if player1_card_rank == player2_card_rank
      nil
    elsif player1_card_rank > player2_card_rank
      @player1
    else
      @player2
    end
  end

  def calculate_winner
    if type == :basic
      player_with_highest_card_at(0)
    elsif type == :war
      player_with_highest_card_at(2)
    elsif type == :mutually_assured_destruction
      "No Winner"
    else
      # ??
    end
  end
end
