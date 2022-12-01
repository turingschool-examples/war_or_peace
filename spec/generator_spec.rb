require './lib/card_generator.rb'



describe 'card_generator' do
  
  it 'is an instance of CardGenerator' do
    new = CardGenerator.new("cards.txt")
    expect(new).to be_a(CardGenerator)
  end

  xit 'can accept a text file' do
    filename = 'cards.txt'
    cards = CardGenerator.new(filename).cards

    expect(filename).to be_a(Deck)
    expect(cards).to be_an(Array)
    expect(cards[0]).to be_a(Card)
  end
end