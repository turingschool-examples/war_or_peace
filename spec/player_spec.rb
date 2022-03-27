require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  describe "Basic Turn"do
    it "it exists" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player).to be_an_instance_of(Player)
    end

    it "has attributes" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player.name).to eq('Clarisa')
      expect(player.deck).to eq(deck)
    end
  end

  describe 'play sequence till player is without cards' do

    it "has_lost? " do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      expect(player.has_lost?).to be(false)
    end

    it "has_lost? " do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      player.deck.remove_card

      expect(player.has_lost?).to be(false)
    end

    it "has_lost? " do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      player.deck.remove_card
      player.deck.remove_card

      expect(player.has_lost?).to be(false)
    end

    it "has_lost? " do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)

      deck = Deck.new([card1, card2, card3])
      player = Player.new('Clarisa', deck)

      player.deck.remove_card
      player.deck.remove_card
      player.deck.remove_card

      expect(player.has_lost?).to be(true)
    end
  end

  describe "War Turn" do
    it "exist" do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)

      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:war)
    end
  end
end
