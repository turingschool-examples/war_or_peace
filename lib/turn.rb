require 'pry'

class Turn

  attr_reader :player1,
              :player2,
              :spoils_of_war
              :turn_winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_winner = winner
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

  def pile_cards
    @turn_winner = winner
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
        @spoils_of_war.flatten!
      end
    elsif type == :mutually_assured_destruction
      players.each do |player|
        3.times do
          player.deck.remove_card
        end
      end
    end
  end
  #returning winner after 1st card removed (basic)
  def award_spoils
    @turn_winner.deck.cards << @spoils_of_war
    @turn_winner.deck.cards.flatten!
  end
end
