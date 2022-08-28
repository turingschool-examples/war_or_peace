require 'rspec'
require './lib/card'
require './lib/deck'
require 'pry'

RSpec.describe Deck do
it "exists" do
   card1 = Card.new(:diamond, 'Queen', 12)
   card2 = Card.new(:spade, '3', 3)
   card3 = Card.new(:heart, 'Ace', 14)
   cards = [card1, card2, card3]
   deck = Deck.new(cards)
   expect(deck).to be_an_instance_of(Deck)
   expect(deck.cards).to eq([card1, card2, card3])
   end
   describe 'checks rank' do
    it "checks a cards rank based on the cards index postion" do
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, 'Ace', 14)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)
     expect(deck.cards).to eq([card1, card2, card3])
     deck.rank_of_card_at(0)
     expect(deck.rank_of_card_at(1)).to eq(3)

  end

    describe 'high rank' do
     it "will return an array of cards in the deck with an rank >= 11" do
       card1 = Card.new(:diamond, 'Queen', 12)
       card2 = Card.new(:spade, '3', 3)
       card3 = Card.new(:heart, 'Ace', 14)
       cards = [card1, card2, card3]
       deck = Deck.new(cards)
       deck.high_ranking_cards
       expect(deck.high_ranking_cards).to eq([card1, card3])

     end

     describe '#percent_high_ranking' do
    it 'returns percentage of high ranking card' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      deck.high_ranking_cards
      expect(deck.high_ranking_cards).to eq([card1, card3])
     end
    end
  end
end

 describe 'remove_card' do
   it 'removes top card from the deck' do
     card1 = Card.new(:diamond, 'Queen', 12)
     card2 = Card.new(:spade, '3', 3)
     card3 = Card.new(:heart, 'Ace', 14)
     cards = [card1, card2, card3]
     deck = Deck.new(cards)
     expect(deck.remove_card).to eq(card1)
   end
 end
 
describe 'add_card' do
it 'adds card to the bottom of the deck' do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)
  card3 = Card.new(:heart, 'Ace', 14)
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  card4 = Card.new(:club, '5', 5)
  deck.add_card(card4)
  expect(deck.cards).to eq([card1, card2, card3, card4])

  end
 end

end


# pry(main)> deck.remove_card
# #=> #<Card:0x007fbfd18490e8 @rank=12, @suit=:diamond, @value="Queen">
#
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
#=> 50.0
# pry(main)> card4 = Card.new(:club, '5', 5)
# #=> #<Card:0x007fbfd2963978 @rank=5, @suit=:club, @value="5">
#
# pry(main)> deck.add_card(card4)
#
# pry(main)> deck.cards
# #=> [#<Card:0x007fbfd19f4fa0...>, #<Card:0x007fbfd18555a0...>, #<Card:0x007fbfd2963978...>]
#
# pry(main)> deck.high_ranking_cards
# #=> [#<Card:0x007fbfd18555a0...>]
#
# pry(main)> deck.percent_high_ranking
# #=> 33.33
