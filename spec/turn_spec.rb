require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  context 'Turn one' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 14)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    # binding.pry

    it 'can determine who its 2 players are' do
      expect(turn.player1.name).to eq("Megan")
      expect(turn.player2.name).to eq("Aurora")
    end

    it 'can determine what type of turn you are taking' do
      expect(turn.type).to eq(:basic)
      expect(turn.spoils_of_war).to eq([])
    end

    it 'can determine a winner' do
      expect(turn.winner).to eq(player1)
    end

    it 'can pile cards' do
      expect(turn.pile_cards).to eq([card1, card3])
    end

    it 'can give the winner the spoils of war' do
      # binding.pry
      turn.pile_cards
      turn.award_spoils
      expect(player1.deck.cards).to include(card3)
      expect(turn.spoils_of_war).to eq([])
    end
  end

  context 'Turn Two' do
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

    it 'can determine what type of turn you are taking' do
      expect(turn.type).to eq(:war)
    end

    it 'can determine a winner' do
      expect(turn.winner).to eq(player2)
    end

    it 'can give the winner the spoils of war' do
      turn.pile_cards
      turn.award_spoils
      expect(player2.deck.cards).to include(card5)
      expect(turn.spoils_of_war).to eq([])
    end
  end

  context 'Turn Three' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, '8', 8)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    it 'can determine what type of turn you are taking' do
      expect(turn.type).to eq(:mutually_assured_destruction)
    end

    it 'can determine a winner' do
      expect(turn.winner).to eq("No Winner")
    end

    it 'can remove cards during a mutually assured destruction turn' do
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([])
      expect(player1.deck.cards).to eq([card8])
      expect(player2.deck.cards).to eq([card7])
    end

  end
end

binding.pry
