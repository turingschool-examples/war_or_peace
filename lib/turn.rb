
# pry(main)> card1 = Card.new(:heart, 'Jack', 11)
# #=> #<Card:0x007fa3edaa0df0 @rank=11, @suit=:heart, @value="Jack">
# pry(main)> card2 = Card.new(:heart, '10', 10)
# #=> #<Card:0x007fa3eda519a8 @rank=10, @suit=:heart, @value="10">
# pry(main)> card3 = Card.new(:heart, '9', 9)
# #=> #<Card:0x007fa3ed98d9b8 @rank=9, @suit=:heart, @value="9">
# pry(main)> card4 = Card.new(:diamond, 'Jack', 11)
# #=> #<Card:0x007fa3ee14ef80 @rank=11, @suit=:diamond, @value="Jack">
# pry(main)> card5 = Card.new(:heart, '8', 8)
# #=> #<Card:0x007fa3edb263d8 @rank=8, @suit=:heart, @value="8">
# pry(main)> card6 = Card.new(:diamond, 'Queen', 12)
# #=> #<Card:0x007fa3eda3e1f0 @rank=12, @suit=:diamond, @value="Queen">
# pry(main)> card7 = Card.new(:heart, '3', 3)
# #=> #<Card:0x007fa3edad1cc0 @rank=3, @suit=:heart, @value="3">
# pry(main)> card8 = Card.new(:diamond, '2', 2)
# #=> #<Card:0x007fa3eda89308 @rank=2, @suit=:diamond, @value="2">
#
# pry(main)> deck1 = Deck.new([card1, card2, card5, card8])
# #=> #<Deck:0x007fa3eda472c8 @cards=[#<Card:0x007fa3edaa0df0...>, #<Card:0x007fa3eda519a8...>, #<Card:0x007fa3edb263d8...>, #<Card:0x007fa3eda89308...>]>
#
# pry(main)> deck2 = Deck.new([card3, card4, card6, card7])
# #=> #<Deck:0x007fa3ee11ee48 @cards=[#<Card:0x007fa3ed98d9b8...>, #<Card:0x007fa3ee14ef80...>, #<Card:0x007fa3eda3e1f0...>, #<Card:0x007fa3edad1cc0...>]>
#
# pry(main)> player1 = Player.new("Megan", deck1)
# #=> #<Player:0x007fa3edae29d0 @deck=#<Deck:0x007fa3eda472c8...>, @name="Megan">
#
# pry(main)> player2 = Player.new("Aurora", deck2)
# #=> #<Player:0x007fa3ed9e6568 @deck=#<Deck:0x007fa3ee11ee48...>, @name="Aurora">
#
# pry(main)> turn = Turn.new(player1, player2)
# #=> #<Turn:0x007fa3edb25d20 @player1=#<Player:0x007fa3edae29d0..., @name="Megan">, @player2=#<Player:0x007fa3ed9e6568..., @name="Aurora">, @spoils_of_war=[]>
#
# pry(main)> turn.player1
# #=> #<Player:0x007fa3edae29d0 @deck=#<Deck:0x007fa3eda472c8...>, @name="Megan">
#
# pry(main)> turn.player2
# #=> #<Player:0x007fa3ed9e6568 @deck=#<Deck:0x007fa3ee11ee48...>, @name="Aurora">
#
# pry(main)> turn.spoils_of_war
# #=> []
#
# pry(main)> turn.type
# #=> :basic
#
# pry(main)> winner = turn.winner
# #=> #<Player:0x007fa3edae29d0 @deck=#<Deck:0x007fa3eda472c8...>, @name="Megan">
#
# pry(main)> turn.pile_cards
#
# pry(main)> turn.spoils_of_war
# #=> [#<Card:0x007fa3edaa0df0 @rank=11, @suit=:heart, @value="Jack">, #<Card:0x007fa3ed98d9b8 @rank=9, @suit=:heart, @value="9">]
#
# pry(main)> turn.award_spoils(winner)
#
# pry(main)> player1.deck
# #=> #<Deck:0x007fa3eda472c8 @cards=[#<Card:0x007fa3eda519a8...>, #<Card:0x007fa3edb263d8...>, #<Card:0x007fa3eda89308...>, #<Card:0x007fa3edaa0df0...>, #<Card:0x007fa3ed98d9b8...>]>
# pry(main)> player2.deck
#=> #<Deck:0x007fa3ee11ee48 @cards=[#<Card:0x007fa3ee14ef80...>, #<Card:0x007fa3eda3e1f0...>, #<Card:0x007fa3edad1cc0...>]>
class Turn
  attr_reader :player1, :player2, :spoils_of_war
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    # require 'pry';binding.pry
  end

  if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2) == @player2.deck.rank_of_card_at(2)
    def mutually_assured_destruction

    end
  elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
    def war

    end

  else
    def basic

    end
  end
  


end
