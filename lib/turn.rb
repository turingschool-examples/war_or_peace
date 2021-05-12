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
    if self.player1.deck.rank_of_card_at(0) == self.player2.deck.rank_of_card_at(0) && self.player1.rank_of_card_at(2) == self.player2.rank_of_card_at(2)
      return :mutually_assured_destruction
    elsif self.player1.deck.rank_of_card_at(0) == self.player2.deck.rank_of_card_at(0)
      return :war
    elsif self.player1.deck.rank_of_card_at(0) != self.player2.deck.rank_of_card_at(0)
      return :basic
    else
      return nil
    end
  end


  def winner()
    players = [self.player1, self.player2]
    
    if self.victor == nil
      if type() == :mutually_assured_destruction
        self.victor = 'No Winner'

      elsif type() == :war
        self.victor = players.max_by do |player|
          player.deck.rank_of_card_at(2)
        end

      elsif type() == :basic
        self.victor = players.max_by do |player|
          player.deck.rank_of_card_at(0)
        end
      end
    end

    return self.victor

  end


  def pile_cards()
    if type() == :basic
      self.spoils_of_war << player1.deck.remove_card
      self.spoils_of_war << player2.deck.remove_card
    elsif type() == :war
      3.times { self.spoils_of_war << player1.deck.remove_card }
      3.times { self.spoils_of_war << player2.deck.remove_card }
    elsif type() == :mutually_assured_destruction
      3.times { player1.deck.remove_card }
      3.times { player2.deck.remove_card }
    end
  end

  def award_spoils(victor)
    if self.spoils_of_war.length > 0
      self.spoils_of_war.each do |card|
        victor.deck.cards << card
      end
      self.spoils_of_war = Array.new
    end
  end


end
