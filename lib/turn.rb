class Turn

  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = :default
    @winner
  end

  def type
    if @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      @type = :basic
    elsif @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      @type = :war
    else
      @type = :mutually_assured_destruction
    end
  end

  def winner
    if @type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif @type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @winner = @player1
      else
        @winner = @player2
      end
    elsif @type == :mutually_assured_destruction
      @winner = 'No Winner'
    end
  end

  def pile_cards
    if @type == :basic #may need to also remove cards from the decks - come back during testing. can use the slice method
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif @type == :war #same as above
      3.times do @spoils_of_war << @player1.deck.remove_card #not sure if the ... works here
      3.times do @spoils_of_war << @player2.deck.remove_card
    elsif @type == :mutually_assured_destruction
      @player1.deck.slice[0, 2]
      @player2.deck.slice[0, 2]
    end
  end

  def award_spoils(winner)
    if @type != :mutually_assured_destruction
      winner.deck << @spoils_of_war #may need to remove cards from the spoils
    end
  end
end
