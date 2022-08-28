class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    #what is convention here?
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)\
      && (player1.deck.cards[2] == nil || player2.deck.cards[2] == nil)
      @type = :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)\
      && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      @type = :mutually_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @type = :war
    else
      @type = :basic
    end
  end

  def winner
    if @type == :basic
      self.basic_winner
    elsif @type == :war
      if player1.deck.cards.count < 3 || player2.deck.cards.count < 3
        self.final_chance_war_winner
      else
        self.war_winner
      end
    else
      "No Winner"
    end
  end

  def basic_winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      @player1
    else
      @player2
    end
  end

  def war_winner
    if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      @player1
    else
      @player2
    end
  end

  def final_chance_war_winner
    if player1.deck.cards.count < 3
      if player1.deck.cards.last.rank <= player2.deck.rank_of_card_at(2)
        @player2
      else
        @player1
      end
    elsif player2.deck.cards.count < 3
      if player2.deck.cards.last.rank <= player1.deck.rank_of_card_at(2)
        @player1
      else
        @player2
      end
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << player1.deck.remove_card
      @spoils_of_war << player2.deck.remove_card
    elsif @type == :war
      # if player1.deck.cards.length < 3 || player2.deck.cards.length < 3
      #   self.pile_final_chance_war
      # else
      #   self.pile_war_cards
      # end
      self.pile_war_cards
    else
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def pile_war_cards
    #needed to split up into two times loops to get in right order
    3.times do
      @spoils_of_war << player1.deck.remove_card
    end
    3.times do
      @spoils_of_war << player2.deck.remove_card
    end
    @spoils_of_war.compact!
  end

  # def pile_final_chance_war
  #   if player1.deck.cards.count < 3
  #     3.times do
  #       @spoils_of_war << player1.deck.remove_card
  #     end
  #     @spoils_of_war.compact!
  #     3.times do
  #       @spoils_of_war << player2.deck.remove_card
  #     end
  #   elsif player2.deck.cards.count < 3
  #     3.times do
  #       @spoils_of_war << player1.deck.remove_card
  #     end
  #     3.times do
  #       @spoils_of_war << player2.deck.remove_card
  #     end
  #     @spoils_of_war.compact!
  #   end
  # end

  def award_spoils(winner)
    @spoils_of_war.each do |spoils_card|
      winner.deck.add_card(spoils_card)
    end
  end
end
