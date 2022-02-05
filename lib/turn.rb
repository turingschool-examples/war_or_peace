# class Card
#   attr_reader :suit, :value, :rank
#
#   def initialize(suit, value, rank)
#     @suit   = suit
#     @value  = value
#     @rank   = rank
#   end
#
# end
#
# class Deck
#
#    attr_reader :cards, :index, :high_cards, :new_card
#
#   def initialize(cards)
#     @cards = cards
#   end
#
#   def rank_of_card_at(index)
#     pick1 = cards[index].rank
#   end
#
#   def high_ranking_cards
#     @high_cards = []
#     cards.each do |strong|
#       if strong.rank >= 11
#         high_cards << strong
#       end
#     end
#     return high_cards
#   end
#
#   def percent_high_ranking
#     hcount = 0
#     card_count = cards.count
#
#     cards.each do |str|
#       if str.rank >= 11
#         hcount += 1
#       end
#     end
#
#     percent = ((hcount.to_f / card_count) * 100).round(2)
#   end
#
#   def remove_card
#     cards.shift
#   end
#
#   def add_card(new_card)
#     cards.push(new_card)
#   end
#
# end
#
#
# class Player
#   attr_reader :name, :deck
#
#   def initialize(name, deck)
#     @name = name
#     @deck = deck
#   end
#
#   def has_lost?
#     # require "pry"; binding.pry
#     if deck.cards.empty?
#       true
#     else
#       false
#     end
#   end
# end

class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1        = player1
    @player2        = player2
    @spoils_of_war  = []
  end

  def type
    if player1.deck.rank_of_card_at(0)  == player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        :mutally_assured_destruction
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
        :war
    elsif player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
        :basic
    end
  end

  def winner
    if type == :basic
      if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
        player1
      else
        player2
      end
    elsif type == :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      else
        player2
      end
    else
      "No winner"
    end
  end

  def pile_cards
    puts type
    puts ""
    if type == :mutally_assured_destruction
      3.times do
          player1.deck.cards.shift
          player2.deck.cards.shift
      end
    elsif type == :war
      3.times do
          spoils_of_war << player1.deck.cards.shift
          spoils_of_war << player2.deck.cards.shift
      end
    elsif type == :basic
        spoils_of_war << player1.deck.cards.shift
        spoils_of_war << player2.deck.cards.shift
    end
    puts type
  end

  def award_spoils(winner)
    @spoils_of_war.each do |win|
      winner.deck.cards << win
    end
  end
end

# require "pry"; binding.pry

# card1 = Card.new(:heart, "Jack", 11)
# card2 = Card.new(:heart, "10", 10)
# card3 = Card.new(:heart, "9", 9)
# card4 = Card.new(:diamond, "Jack", 11)
# card5 = Card.new(:heart, "8", 8)
# card6 = Card.new(:diamond, "Queen", 12)
# card7 = Card.new(:heart, "3", 3)
# card8 = Card.new(:diamond, "2", 2)
#
# deck1 = Deck.new([card1, card2, card5, card8])
# deck2 = Deck.new([card3, card4, card6, card7])
#
# player1 = Player.new("Megan", deck1)
# player2 = Player.new("Aurora", deck2)
#
# turn = Turn.new(player1, player2)
#
# winner = turn.winner
#
# puts player1.deck.cards
#
# turn.pile_cards
# puts ""
# puts turn.spoils_of_war
# turn.award_spoils(winner)
# puts ""
# puts turn.winner.deck.cards
