class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def get_card_rank(player, index)
    player.deck.rank_of_card_at(index)
  end

  def card_rank_match?(index)
    get_card_rank(@player1, index) == get_card_rank(@player2, index)
  end

  def card_rank_winner(index)
    if get_card_rank(@player1, index) > get_card_rank(@player2, index)
      @player1
    else
      @player2
    end
  end

  def type
    return :mutually_assured_destruction if card_rank_match?(0) && card_rank_match?(2)
    return :war if card_rank_match?(0)
    return :basic unless card_rank_match?(0)
  end

  def winner
    case type
    when :mutually_assured_destruction
      'No Winner'
    when :war
      card_rank_winner(2)
    else
      card_rank_winner(0)
    end
  end

  def cards_to_spoils(player, num_cards)
    num_cards.times do
      card = player.deck.remove_card
      @spoils_of_war << card unless card.nil?
    end
  end

  def award_spoils(winning_player)
    winning_player.deck.cards += spoils_of_war
  end

  def pile_cards
    if type == :basic
      cards_to_spoils(@player1, 1)
      cards_to_spoils(@player2, 1)
    else
      cards_to_spoils(@player1, 3)
      cards_to_spoils(@player2, 3)
    end
  end
end
