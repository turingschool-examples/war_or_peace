attr_reader :cards

def initialize(cards)
  @cards = cards
end





def percent_high_ranking()
  percentage_high_cards = @cards.select do |card|
    card.rank >= 11
  end
  percent = (percentage_high_cards.length).to_f / (@cards.length).to_f
  return (percent * 100).round(1)
end

def remove_card
  @cards.delete_at(0)
end

def add_card(card)
  @cards << card
end
end

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type()
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return @type = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      return @type = :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return @type = :mutually_assured_destruction
    end
  end

  def winner()
    if @type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return player1.name
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        return player2.name
      end
    elsif @type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return player1.name
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        return player2.name
      end
    elsif @type == :mutually_assured_destruction
      return 'No Winner'
    end
  end

  def pile_cards
    if @type == :basic
      @spoils_of_war << player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards.shift
    elsif @type == :war
      @spoils_of_war << player1.deck.cards.shift(3)
      @spoils_of_war << player2.deck.cards.shift(3)
    elsif @type == :mutually_assured_destruction
      player1.deck.cards.shift(3)
      player2.deck.cards.shift(3)
    end
  end

  def award_spoils(winner)

  end
end


class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    if deck.cards.length == 0
      return true
    else
      return false
    end
  end
end




# card1 = Card.new(:heart, 'Jack', 11)
# card2 = Card.new(:heart, '10', 10)
# card3 = Card.new(:heart, '9', 9)
# card4 = Card.new(:diamond, 'Jack', 11)
# card5 = Card.new(:heart, '8', 8)
# card6 = Card.new(:diamond, 'Queen', 12)
# card7 = Card.new(:heart, '3', 3)
# card8 = Card.new(:diamond, '2', 3)
# deck1 = Deck.new([card1, card2, card5, card8])
# deck2 = Deck.new([card4, card3, card6, card7])
# player1 = Player.new("Megan", deck1)
# player2 = Player.new("Aurora", deck2)
# turn = Turn.new(player1, player2)
# p turn.type
# p turn.winner
# turn.pile_cards
# p turn.spoils_of_war
# p player1.deck.cards
# p player2.deck.cards
