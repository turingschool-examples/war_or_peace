require './lib/card'

RSpec.describe Card do
  describe 'instantiation' do
    it "::new" do
      card = Card.new(:heart, 'Jack', 11)

      expect(card).to be_an_instance_of(Card)
    end

    it "has readable attributes" do
      card = Card.new(:heart, 'Jack', 11)

      expect(card.suit).to eq(:heart)
      expect(card.value).to eq('Jack')
      expect(card.rank).to eq(11)
    end
  end
end


# card = Card.new(:diamond, 'Ace', 14)
# card = Card.new(:spade, 'Ace', 14)
# card = Card.new(:heart, 'Ace', 14)
# card = Card.new(:club, 'Ace', 14)
# card = Card.new(:diamond, 'King', 13)
# card = Card.new(:spade, 'King', 13)
# card = Card.new(:heart, 'King', 13)
# card = Card.new(:club, 'King', 13)
# card = Card.new(:diamond, 'Queen', 12)
# card = Card.new(:spade, 'Queen', 12)
# card = Card.new(:heart, 'Queen', 12)
# card = Card.new(:club, 'Queen', 12)
# card = Card.new(:diamond, 'Jack', 11)
# card = Card.new(:spade, 'Jack', 11)
# card = Card.new(:heart, 'Jack', 11)
# card = Card.new(:club, 'Jack', 11)
# card = Card.new(:diamond, '10', 10)
# card = Card.new(:spade, '10', 10)
# card = Card.new(:heart, '10', 10)
# card = Card.new(:club, '10', 10)
# card = Card.new(:diamond, '9', 9)
# card = Card.new(:spade, '9', 9)
# card = Card.new(:heart, '9', 9)
# card = Card.new(:club, '9', 9)
# card = Card.new(:diamond, '8', 8)
# card = Card.new(:spade, '8', 8)
# card = Card.new(:spade, '8', 8)
# card = Card.new(:spade, '8', 8)
# card = Card.new(:spade, '7', 7)
# card = Card.new(:spade, '7', 7)
# card = Card.new(:spade, '7', 7)
# card = Card.new(:spade, '7', 7)
# card = Card.new(:spade, '6', 6)
# card = Card.new(:spade, '6', 6)
# card = Card.new(:spade, '6', 6)
# card = Card.new(:spade, '6', 6)
# card = Card.new(:spade, '5', 5)
# card = Card.new(:spade, '5', 5)
# card = Card.new(:spade, '5', 5)
# card = Card.new(:spade, '5', 5)
# card = Card.new(:spade, '4', 4)
# card = Card.new(:spade, '4', 4)
# card = Card.new(:spade, '4', 4)
# card = Card.new(:spade, '4', 4)
# card = Card.new(:spade, '3', 3)
# card = Card.new(:spade, '3', 3)
# card = Card.new(:spade, '3', 3)
# card = Card.new(:spade, '3', 3)
# card = Card.new(:spade, '2', 2)
# card = Card.new(:spade, '2', 2)
# card = Card.new(:spade, '2', 2)
# card = Card.new(:spade, '2', 2)
# card = Card.new(:spade, '1', 1)
# card = Card.new(:spade, '1', 1)
# card = Card.new(:spade, '1', 1)
# card = Card.new(:spade, '1', 1)
