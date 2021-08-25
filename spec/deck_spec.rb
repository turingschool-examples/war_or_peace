require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    deck = Deck.new(:cards)

    expect(deck).to be_an_instance_of(Deck)
  end
end

#describe Deck do
  #describe '#initialize' do
    #it 'is an instance of deck' do
      #deck = Deck.new('Deck1')
      #expect(deck).to be_a Deck
    #end
  #end
#end
