require_relative 'player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :victor

  def initialize(player1=Player.new, player2=Player.new)
    player1.class != Player ? @player1 = Player.new : @player1 = player1
    player2.class != Player ? @player2 = Player.new : @player2 = player2
    @spoils_of_war = Array.new
    @victor = nil
  end

  def type
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && (
      player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if @victor == nil
      if type == :mutually_assured_destruction
        @victor = 'No Winner'
      elsif type == :war
        @victor = [player1, player2].max_by { |player| player.deck.rank_of_card_at(2).to_s.to_i }
      elsif type == :basic
        @victor = [player1, player2].max_by { |player| player.deck.rank_of_card_at(0).to_s.to_i }
      end
    end
    @victor
  end

  def pile_cards
    if type == :mutually_assured_destruction
      3.times { player1.deck.remove_card }
      3.times { player2.deck.remove_card }
    elsif type == :war
      3.times { @spoils_of_war.unshift(player1.deck.remove_card) }
      3.times { @spoils_of_war.unshift(player2.deck.remove_card) }
    elsif type == :basic
      @spoils_of_war.unshift(player1.deck.remove_card)
      @spoils_of_war.unshift(player2.deck.remove_card)
    end
  end

  def award_spoils(victor)
    if @spoils_of_war.length > 0 && victor.class == Player
      @spoils_of_war.each { |card| victor.deck.add_card(card) }
      @spoils_of_war = Array.new
    end
  end

end
