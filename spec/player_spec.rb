require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heard, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)

    player = Player.new('Clarisa', deck)
    expect(player).to be_an_instance_of(Player)
  end

   it "has readable attributes" do
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heard, 'Ace', 14)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)
     player = Player.new('Clarisa', deck)

     expect(player.name).to eq('Clarisa')
#     expect(player.deck).to have_at_least(1).items
   end

    it "has win or lost eval " do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heard, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to eq(false)
    end

#    it "has remove a card " do
#      card1 = Card.new(:diamond, 'Queen', 12)
#      card2 = Card.new(:spade, '3', 3)
#      card3 = Card.new(:heard, 'Ace', 14)
#      cards = [card1, card2, card3]
#      deck = Deck.new(cards)
#      player = Player.new('Clarisa', deck)

#      expect(player.remove_card).to eq(false)
#    end

  #
  # it "has cards" do
  #   deck = Deck.new(cards)
  #   cards_in_deck = (deck.cards).length
  #   expect(cards_in_deck).to eq(3)
  # end
end
