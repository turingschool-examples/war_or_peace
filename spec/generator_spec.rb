require './lib/card_generator.rb'


describe 'card_generator' do
  
  it 'is an instance of CardGenerator' do
    new = CardGenerator.new("filename")
    expect(new).to be_a(CardGenerator)
  end

  xit 'can accept a text file' do
    filename = 'cards.txt'
    cards = CardGenerator.new(filename).cards

    expect(cards).to be_a(Array)
    expect(cards[0]).to be_a(Card)
  end
end