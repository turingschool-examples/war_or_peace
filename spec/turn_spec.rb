require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Turn do
  context 'Turn' do
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    it 'can determine who its 2 players are' do
      expect(turn.player1.name).to eq("Megan")
      expect(turn.player2.name).to eq("Aurora")
    end

    it 'can determine what type of turn you are taking' do
      expect(turn.type).to eq(:basic)
      expect(turn.spoils_of_war).to eq([])
    end

  end
end
