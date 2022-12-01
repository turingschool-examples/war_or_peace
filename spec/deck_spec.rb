require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
    context 'Test Set 1' do
        it "exists" do
            card1 = Card.new(:spades, 'Ace', 14)
            card2 = Card.new(:diamonds, 'Eight', 8)
            card3 = Card.new(:clubs, 'Five', 5)

            cards_arr = [card1, card2, card3]
            deck = Deck.new(cards_arr)

            expect(deck).to be_an_instance_of(Deck)
        end
    end

    # xit "has readable attributes" do
    #     card = Card.new(:diamonds, 'Queen', 12)

    #     expect(card.suit).to eq(:diamonds)
    #     expect(card.value).to eq('Queen')
    #     expect(card.rank).to eq(12)
    # end
end
  