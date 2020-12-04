require 'pry'

class Turn

  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def rank_test(index)
    @player1.deck.rank_of_card_at(index) == @player2.deck.rank_of_card_at(index)
  end

  def type
    if rank_test(0) && rank_test(2)
      :mutually_assured_destruction
    elsif rank_test(0)
      :war
    else
      :basic
    end
  end

  def rank_get(player, index)
    player.deck.rank_of_card_at(index)
  end

  def winner
    if type == :basic
      if rank_get(@player1, 0) > rank_get(@player2, 0)
        @player1
      else
        @player2
      end
    elsif type == :war
      if rank_get(@player1, 2) > rank_get(player2, 2)
        @player1
      else
        @player2
      end
    elsif type == :mutually_assured_destruction
      'No Winner'
    end
  end

  #refactor to .map? Might not work
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
      end
    elsif type == :mutually_assured_destruction
      players.each do |player|
        3.times do
          player.deck.remove_card
        end
      end
    end
  end
end
