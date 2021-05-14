attr_reader :cards

def initialize(cards)
  @cards = cards
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

  def type
    if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
      return @type = :basic
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) != @player2.deck.rank_of_card_at(2)
      return @type = :war
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
      return @type = :mutually_assured_destruction
    end
  end

  def winner
    if @type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        return @player1
      elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
        return @player2
      end
    elsif @type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        return @player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        return @player2
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

def type
  if first_card(@player1) == first_card(@player2) && third_card(@player1) == third_card(@player2)
    :mutually_assured_destruction
  elsif first_card(@player1) == first_card(@player2) && third_card(@player1) != third_card(@player2)
    :war
  else
    :basic
  end
end


# # suit, value rank
#
# full_deck = [[:heart, '2', 2],
# [:heart, '3', 3],
# [:heart, '4', 4],
# [:heart, '5', 5],
# [:heart, '6', 6],
# [:heart, '7', 7],
# [:heart, '8', 8],
# [:heart, '9', 9],
# [:heart, '10', 10],
# [:heart, 'Jack', 11],
# [:heart, 'Queen', 12],
# [:heart, 'King', 13],
# [:heart, 'Ace', 14],
# [:spade, '2', 2],
# [:spade, '3', 3],
# [:spade, '4', 4],
# [:spade, '5', 5],
# [:spade, '6', 6],
# [:spade, '7', 7],
# [:spade, '8', 8],
# [:spade, '9', 9],
# [:spade, '10', 10],
# [:spade, 'Jack', 11],
# [:spade, 'Queen', 12],
# [:spade, 'King', 13],
# [:spade, 'Ace', 14],
# [:club, '2', 2],
# [:club, '3', 3],
# [:club, '4', 4],
# [:club, '5', 5],
# [:club, '6', 6],
# [:club, '7', 7],
# [:club, '8', 8],
# [:club, '9', 9],
# [:club, '10', 10],
# [:club, 'Jack', 11],
# [:club, 'Queen', 12],
# [:club, 'King', 13],
# [:club, 'Ace', 14],
# [:diamond, '2', 2],
# [:diamond, '3', 3],
# [:diamond, '4', 4],
# [:diamond, '5', 5],
# [:diamond, '6', 6],
# [:diamond, '7', 7],
# [:diamond, '8', 8],
# [:diamond, '9', 9],
# [:diamond, '10', 10],
# [:diamond, 'Jack', 11],
# [:diamond, 'Queen', 12],
# [:diamond, 'King', 13],
# [:diamond, 'Ace', 14]]
# suit, value rank

# shuffled_full_deck = full_deck.shuffle
#
# p deck1 = shuffled_full_deck[0..25]
# p deck2 = shuffled_full_deck[26..51]

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
