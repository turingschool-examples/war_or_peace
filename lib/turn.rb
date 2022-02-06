require './lib/player'

class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize (player1, player2)

    @player1 = player1
    @player2 = player2
    @spoils_of_war = []

  end



  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return "MAD"

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      return "war"

    elsif @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0)
        return "basic"
    end
  end

  def winner

    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      return @player1
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      return @player2
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
      return @player1
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
      return @player2
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return "Mutally Assured Desstruction"
    end

  end

  def pile_cards

    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) || @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)

      return @spoils_of_war << @player1.deck.cards[0] << @player2.deck.cards[0]

    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)

      return @spoils_of_war << @player1.deck.cards[0 .. 2] << @player2.deck.cards[0 .. 2]

    end


  end

  def award_spoils

    if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
      @player1.deck.cards << @spoils_of_war
    elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
      @player2.deck.cards << @spoils_of_war
    end

  end


end

# @card1 = Card.new(:heart, 'Jack', 11)
# @card2 = Card.new(:heart, '10', 10)
# @card3 = Card.new(:heart, '9', 9)
# @card4 = Card.new(:diamond, 'Jack', 11)
# @card5 = Card.new(:heart, '8', 8)
# @card6 = Card.new(:diamond, 'Queen', 12)
# @card7 = Card.new(:heart, '3', 3)
# @card8 = Card.new(:diamond, '2', 2)
#
# @cards = [@card1,@card2,@card3,@card4,@card5,@card6,@card7,@card8]
#
# @deck1 = Deck.new([@card1,@card2,@card5,@card8])
# @deck2 = Deck.new([@card4,@card3,@card6,@card7])
#
# @player1 = Player.new("Megan", @deck1)
# @player2 = Player.new("Arora", @deck2)
#
# @turn = Turn.new(@player1,@player2)
#
#
# puts @turn.pile_cards
