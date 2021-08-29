require './lib/card_generator'


describe CardGenerator do
  describe '#import_cards' do
    it 'includes all 52 card objects' do
      card_object = CardGenerator.new('./lib/cards.txt')
      card_object.import_cards

      expect(card_object.cards.count).to eq(52)
  end
end
end
