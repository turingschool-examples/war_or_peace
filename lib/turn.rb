# require './lib/card'
# require './lib/deck'
# require './lib/player'
# require './lib/turn'


class Turn
  attr_accessor :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    @player1.deck.rank_of_card_at(0) != @player2.deck.rank_of_card_at(0) ? :basic : (@player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2) ? :war : :mutually_assured_destruction)
  end

  def winner
    if type == :basic
      @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0) ? @player1.name : @player2.name
    elsif type == :war
      @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2) ? @player1.name : @player2.name
    elsif type == :mutually_assured_destruction
      'No Winner'
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards.first && @spoils_of_war << @player2.deck.cards.first
    elsif type == :war
      @spoils_of_war << @player1.deck.cards[0] && @spoils_of_war << @player1.deck.cards[1] && @spoils_of_war << @player1.deck.cards[2] && @spoils_of_war << @player2.deck.cards[0] && @spoils_of_war << @player2.deck.cards[1] && @spoils_of_war << @player1.deck.cards[2]

    end
  end

  def award_spoils(winner)
    if winner == 'Megan' && type == :basic
      @player1.deck.cards << @spoils_of_war
      @player2.deck.cards = @player2.deck.cards.drop(1)
      @player1.deck.cards = @player1.deck.cards.flatten.uniq
    elsif winner == 'Aurora' && type == :basic
      @player2.deck.cards << @spoils_of_war
      @player1.deck.cards = @player1.deck.cards.drop(1)
      @player2.deck.cards = @player2.deck.cards.flatten.uniq
    elsif winner == 'Megan' && type == :war
      @player1.deck.cards << @spoils_of_war
      @player2.deck.cards = @player2.deck.cards.drop(3)
      @player1.deck.cards = @player1.deck.cards.flatten.uniq
    elsif winner == 'Aurora' && type == :war
      @player2.deck.cards << @spoils_of_war
      @player1.deck.cards = @player1.deck.cards.drop(3)
      @player2.deck.cards = @player2.deck.cards.flatten.uniq
    elsif winner == 'No Winner' && type == :mutually_assured_destruction
      @player1.deck.cards = @player1.deck.cards.drop(3)
      @player2.deck.cards = @player2.deck.cards.drop(3)
    end
  end
end

# **Set-up for mutually_assured_destruction currently**
# card1 = Card.new(:heart, 'Jack', 11)
# card2 = Card.new(:heart, '10', 10)
# card3 = Card.new(:heart, '9', 9)
# card4 = Card.new(:diamond, 'Jack', 11)
# card5 = Card.new(:heart, '8', 8)
# card6 = Card.new(:diamond, '8', 8)
# card7 = Card.new(:heart, '3', 3)
# card8 = Card.new(:diamond, '2', 2)
#
# deck1 = Deck.new([card1, card2, card5, card8])
#
# deck2 = Deck.new([card4, card3, card6, card7])
#
# player1 = Player.new("Megan", deck1)
#
# player2 = Player.new("Aurora", deck2)
#
# turn = Turn.new(player1, player2)
#
#
# winner = turn.winner
# turn.pile_cards
# p 'type'
# p turn.type
#
# turn.award_spoils(winner)
# p '-----------------------------'
# p 'player 1 deck'
# p player1.deck
# p '-----------------------------'
# p 'player 2 deck'
# p player2.deck
