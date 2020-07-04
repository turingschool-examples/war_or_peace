require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/game'


# Generating the standad deck
card_ranks = (2..14).to_a
high_card_values = { 11 => "Jack", 12 => "Queen", 13 => "King", 14 => "Ace" }
suits = [:heart, :spade, :club, :diamond]

standard_deck = card_ranks.map do |rank|
  suits.map do |suit|
    if rank < 11
      Card.new(suit, rank.to_s, rank)
    else
      Card.new(suit, high_card_values[rank], rank)
    end
  end
end.flatten!

# Generating Player Decks
random_deck = standard_deck.shuffle!
random_deck_split = random_deck.each_slice(26).map { |deck_half| deck_half }

cards1 = random_deck_split[0]
cards2 = random_deck_split[1]

deck1 = Deck.new(cards1)
deck2 = Deck.new(cards2)

# Generate Players
player1 = Player.new("Linda", deck1)
player2 = Player.new("Bob", deck2)


# SMALL DECKS FOR TESTING
# card1 = Card.new(:heart, 'Jack', 11)
# card2 = Card.new(:heart, '10', 10)
# card3 = Card.new(:heart, '9', 9)
# card4 = Card.new(:diamond, 'Jack', 11)
# card5 = Card.new(:heart, '8', 8)
# card6 = Card.new(:diamond, 'Queen', 12)
# card7 = Card.new(:heart, '3', 3)
# card8 = Card.new(:diamond, '2', 2)
#
# # Bacic Turn 11, 10, 8, 2
# deck1 = Deck.new([card1, card2, card5, card8])
# deck2 = Deck.new([card3, card4, card6, card7])
#
# player1 = Player.new("Megan", deck1)
# player2 = Player.new("Aurora", deck2)
#
# # War Turn
# deck3 = Deck.new([card4, card3, card6, card7])
# player3 = Player.new("Harry", deck3)
#
# # Mutually Assured Destruction (MAD) Turn
# card9 = Card.new(:diamond, '8', 8)
# deck4 = Deck.new([card4, card3, card9, card7])
# player4 = Player.new("Charles", deck4)
#
# # One player has 2 Cards and there is war
# # 9, 2, 8, 11
# deck5 = Deck.new([card3, card8, card5, card1])
# player5 = Player.new("Bubba", deck5)

# Start Game
game = Game.new(player1, player2)
game.start
