require_relative 'card'
require_relative 'deck'
require_relative 'player'

class Turn
  attr_reader :player1, :player2
  attr_accessor :spoils_of_war, :victor

  def initialize(player1=Player.new, player2=Player.new)
    if player1.class != Player
      @player1 = Player.new
    else
      @player1 = player1
    end

    if player2.class != Player
      @player2 = Player.new
    else
      @player2 = player2
    end

    @spoils_of_war = Array.new
    @victor = nil
  end


  def type()
    player1_rank_at_0 = self.player1.deck.rank_of_card_at(0)
    player1_rank_at_2 = self.player1.deck.rank_of_card_at(2)
    player2_rank_at_0 = self.player2.deck.rank_of_card_at(0)
    player2_rank_at_2 = self.player2.deck.rank_of_card_at(2)

    if player1_rank_at_0 == player2_rank_at_0 && player1_rank_at_2 == player2_rank_at_2
      return :mutually_assured_destruction
    elsif player1_rank_at_0 == player2_rank_at_0
      return :war
    elsif player1_rank_at_0 != player2_rank_at_0
      return :basic
    end

  end


  def winner()
    players = [self.player1, self.player2]

    if self.victor == nil
      if type() == :mutually_assured_destruction
        result = 'No Winner'

      elsif type() == :war
        result = players.max_by do |player|
          player.deck.rank_of_card_at(2).to_s.to_i
        end

      elsif type() == :basic
        result = players.max_by do |player|
          player.deck.rank_of_card_at(0).to_s.to_i
        end
      end

      self.victor = result unless result == nil
    end

    return self.victor

  end


  def pile_cards()
    if type() == :basic
      self.spoils_of_war << self.player1.deck.remove_card
      self.spoils_of_war << self.player2.deck.remove_card
    elsif type() == :war
      3.times { self.spoils_of_war << self.player1.deck.remove_card }
      3.times { self.spoils_of_war << self.player2.deck.remove_card }
    elsif type() == :mutually_assured_destruction
      3.times { self.player1.deck.remove_card }
      3.times { self.player2.deck.remove_card }
    end
  end


  def award_spoils(victor)
    if self.spoils_of_war.length > 0 && victor.class == Player
      self.spoils_of_war.each do |card|
        victor.deck.cards << card
      end
      self.spoils_of_war = Array.new
    end
  end


end
