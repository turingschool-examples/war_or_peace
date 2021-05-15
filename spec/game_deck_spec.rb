require 'rspec'
require './lib/game_deck'


describe GameDeck do
  context 'Build' do
    it 'is a 52 card deck' do
      deck1 = GameDeck.new
      deck1.build_game_deck

      expect(deck1).to be_an_instance_of(GameDeck)
      expect(deck1.deck.cards.length).to eq(52)
      expect(deck1.deck.cards.first.rank).to eq(2)
      expect(deck1.deck.cards.first.value).to eq('2')
      expect(deck1.deck.cards.first.suit).to eq(:heart)
      expect(deck1.deck.cards.last.rank).to eq(14)
      expect(deck1.deck.cards.last.value).to eq('Ace')
      expect(deck1.deck.cards.last.suit).to eq(:club)
    end
  end
end
