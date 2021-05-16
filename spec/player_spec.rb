require 'rspec'
require '.lib/card'
require '.lib/deck'


describe Player do
  context 'Attributes' do
    it 'is a player' do
      clarissa = Player.new('Clarissa', deck)
      expect(clarissa).to be_an_instance_of(Player)
    end

    it 'has a name' do
      clarissa = Player.new('Clarissa', deck)
      expect(clarissa.name).to eq('Clarissa')
    end

    it 'has a deck' do
      clarissa = Player.new('Clarissa', deck)
      expect(clarissa.deck).to eq(deck)
    end

    it 'has lost?' do
      clarissa = Player.new('Clarissa', deck)
      # code here
    end
end
