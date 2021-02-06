class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = type
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
      :basic
    end
  end

  def winner
    basic_winner = @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
    war_winner = @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)

    if @type == :basic && basic_winner == true
      @player1
    else
      @player2
    end
    if @type == :war && war_winner == true
      @player2
    else
      @player1
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war.unshift(@player2.deck.cards[0])
      @player2.deck.cards.delete_at(0)
      @spoils_of_war.unshift(@player1.deck.cards[0])
      @player1.deck.cards.delete_at(0)
    elsif @type == :war
      @spoils_of_war.unshift(@player1.deck.cards[0])
      @spoils_of_war.unshift(@player1.deck.cards[0])
      @spoils_of_war.unshift(@player1.deck.cards[0])
      @player1.deck.cards.delete_at(0)
      @player1.deck.cards.delete_at(0)
      @player1.deck.cards.delete_at(0)
      @spoils_of_war.unshift(@player2.deck.cards[0])
      @spoils_of_war.unshift(@player2.deck.cards[0])
      @spoils_of_war.unshift(@player2.deck.cards[0])
      @player2.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(0)
      @player2.deck.cards.delete_at(0)
    else @type == :mutually_assured_destruction
      'No Winner'
      end
    end

    def award_spoils(winner)
      @spoils_of_war.each do |card|
      winner.deck.cards << card
    end
      winner.deck.cards
    end

end
