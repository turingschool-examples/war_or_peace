require 'rspec'
require './lib/card'
# double check that you are in your war_or_peace project directory!
# pry(main)> require './lib/card'
#=> true

require './lib/deck'
# pry(main)> require './lib/deck'
#=> true

RSpec.describe Deck do
  
  # adding all of the tests for the methods and variables I will be using throughout
  # each other test once here, and making sure they're set up as instance variables
  
  before(:each) do
    @card1 = Card.new(:diamond, 'Queen', 12)
    # pry(main)> @card1 = Card.new(:diamond, 'Queen', 12) 
    # => #<Card:0x00000001073caea8 @rank=12, @suit=:diamond, @value="Queen">

    @card2 = Card.new(:spade, '3', 3)
    # pry(main)> @card2 = Card.new(:spade, '3', 3)
    # => #<Card:0x00000001077cf030 @rank=3, @suit=:spade, @value="3">

    @card3 = Card.new(:heart, 'Ace', 14)
    # pry(main)> @card3 = Card.new(:heart, 'Ace', 14)
    # => #<Card:0x00000001071d06c0 @rank=14, @suit=:heart, @value="Ace">
        
    @cards = [@card1, @card2, @card3]
    # pry(main)> @cards = [card1, card2, card3]
    # =>[#<Card:0x00000001073caea8 @rank=12, @suit=:diamond, @value="Queen">,
        #<Card:0x00000001077cf030 @rank=3, @suit=:spade, @value="3">,
        #<Card:0x00000001071d06c0 @rank=14, @suit=:heart, @value="Ace">]

    @deck = Deck.new(@cards)
    # pry(main)> @deck = Deck.new(cards)
    # => #<Deck:0x0000000108ff0010
          #@cards=
            #[#<Card:0x0000000107f65a38 @rank=12, @suit=:diamond, @value="Queen">,
            #<Card:0x00000001089e0490 @rank=3, @suit=:spade, @value="3">,
            #<Card:0x0000000108fd9d60 @rank=14, @suit=:heart, @value="Ace">]>
  end
  
  # test the object creation method
  it "exists" do 
    expect(@deck).to be_an_instance_of(Deck)

    expect(@deck.cards).to eq([@card1, @card2, @card3])
    # pry(main)> deck.cards
    # => [#<Card:0x0000000107f65a38 @rank=12, @suit=:diamond, @value="Queen">,
          #<Card:0x00000001089e0490 @rank=3, @suit=:spade, @value="3">,
          #<Card:0x0000000108fd9d60 @rank=14, @suit=:heart, @value="Ace">]

  end
  
  # test the rank_of_card_at method
  it "returns rank of card at given index position" do
    
    #test the index positions first
    expect(@deck.cards[0]).to eq(@card1)
    # pry(main)> deck.cards[0]
    # => #<Card:0x0000000107f65a38 @rank=12, @suit=:diamond, @value="Queen">
 
    expect(@deck.cards[1].value).to eq("3")  
    # pry(main)> deck.cards[1]
    #=> #<Card:0x00000001089e0490 @rank=3, @suit=:spade, @value="3">
    
    expect(@deck.cards[2].rank).to eq(14) 
    # pry(main)> deck.cards[2]
    #=> #<Card:0x0000000108fd9d60 @rank=14, @suit=:heart, @value="Ace">

    #then test the index values to confirm the rank is correct
    expect(@deck.rank_of_card_at(0)).to eq(12)
    # pry(main)> deck.rank_of_card_at(0)
    #=> 12

    expect(@deck.rank_of_card_at(2)).to eq(14)
    # pry(main)> deck.rank_of_card_at(2)
    #=> 14
  
  end
  
  # test if only high ranking cards are returned (11 or above / face cards)
  it "returns only high ranking cards" do
    expect(@deck.cards)
    # pry(main)> deck.cards
    # => [#<Card:0x0000000107ad66e8 @rank=12, @suit=:diamond, @value="Queen">,
          #<Card:0x0000000107ad6670 @rank=3, @suit=:spade, @value="3">,
          #<Card:0x0000000107ad65f8 @rank=14, @suit=:heart, @value="Ace">]

    expect(@deck.high_ranking_cards).to eq([@card1, @card3])
    # pry(main)> deck.high_ranking_cards
    # #=> [#<Card:0x0000000107ad66e8 @rank=12, @suit=:diamond, @value="Queen">, 
          #<Card:0x0000000107ad65f8 @rank=14, @suit=:heart, @value="Ace">]

  end

  # test if this method calculates the percent of high ranking cards
  it "calculates percent high ranking cards" do
    expect(@deck.percent_high_ranking).to eq(66.67)
    # pry(main)> deck.percent_high_ranking
    # #=> 66.67
  
  end
  
  # test the remove_card method to remove the first card from the array
  it "removes the top card from the deck" do
  
    expect(@deck.remove_card).to eq(@card1)
    #pry(main)> @deck.remove_card
    #=> #<Card:0x007fbfd18490e8 @rank=12, @suit=:diamond, @value="Queen">

    expect(@deck.cards).to eq([@card2, @card3])
    #pry(main)> @deck.cards
    #=> [#<Card:0x0000000102afaf48 @rank=3, @suit=:spade, @value="3">,
        #<Card:0x0000000102afa6d8 @rank=14, @suit=:heart, @value="Ace">]

    expect(@deck.high_ranking_cards).to eq([@card3])
    #pry(main)> @deck.high_ranking_cards
    #=> [#<Card:0x0000000102afa6d8 @rank=14, @suit=:heart, @value="Ace">]

    expect(@deck.percent_high_ranking).to eq(50.0)
    #pry(main)> @deck.percent_high_ranking
    #=> 50.0

  end
  #require 'pry'; binding.pry
  #test the add_card method to make sure it's adding the card to the array
  it "adds a card to the bottom of the deck" do
    @cards = [@card2, @card3]
    @deck = Deck.new(@cards)
    @card4 = Card.new(:club, '5', 5)
    
    #expect(@card4).to eq(@card4)
    #pry(main)> @card4 = Card.new(:club, '5', 5)
    #=> #<Card:0x0000000105d9e350 @rank=5, @suit=:club, @value="5">

    expect(@deck.add_card(@card4)).to eq([@card2, @card3, @card4])
    #pry(main)> @deck.add_card(@card4)
    #=> [#<Card:0x0000000102afaf48 @rank=3, @suit=:spade, @value="3">,
        #<Card:0x0000000102afa6d8 @rank=14, @suit=:heart, @value="Ace">,
        #<Card:0x0000000105d9e350 @rank=5, @suit=:club, @value="5">]
    
    expect(@deck.cards).to eq([@card2, @card3, @card4])
    #pry(main)> @deck.cards
    #=> [#<Card:0x0000000102afaf48 @rank=3, @suit=:spade, @value="3">,
        #<Card:0x0000000102afa6d8 @rank=14, @suit=:heart, @value="Ace">,
        #<Card:0x0000000105d9e350 @rank=5, @suit=:club, @value="5">]

    expect(@deck.high_ranking_cards).to eq([@card3])
    #pry(main)> @deck.high_ranking_cards
    #=> [#<Card:0x0000000102afa6d8 @rank=14, @suit=:heart, @value="Ace">]

    expect(@deck.percent_high_ranking).to eq(33.33)
    #pry(main)> @deck.percent_high_ranking
    #=> 33.33

  end

end