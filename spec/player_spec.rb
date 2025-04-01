require 'rspec'
require './lib/card'
#pry(main)> require './lib/card'
#=> true

require './lib/deck'
#pry(main)> require './lib/deck'
#=> true

require './lib/player'
#pry(main)> require './lib/player'
#=> true
#require 'pry'; binding.pry
RSpec.describe Player do

  before(:each) do

    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
            
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    
    @player = Player.new("Clarisa", @deck)

  end

  # test to see if the player exists
  it "exists" do
    expect(@player).to be_an_instance_of(Player)
    @player = Player.new("Clarisa", @deck)
    #=> #<Player:0x0000000104404bb0, @deck= #<Deck:0x0000000104345a80, 
        #@cards= [#<Card:0x00000001040f53c0 @rank=12, @suit=:diamond, @value="Queen">,
        #<Card:0x000000010409fc90 @rank=3, @suit=:spade, @value="3">,
        #<Card:0x00000001042a0828 @rank=14, @suit=:heart, @value="Ace">]>, @name= "Clarisa">
  end

  # test to see if the player has a name
  it "has a name" do
    expect(@player.name).to eq("Clarisa")
    #pry(main)> @player.name
    #=> "Clarisa"
  end

  # test to see if the player has a deck
  it "has a deck" do
    expect(@player.deck).to eq(@deck)
    #pry(main)> @player.deck
    #=> #<Deck:0x0000000104345a80, @cards= [#<Card:0x00000001040f53c0 @rank=12, @suit=:diamond, @value="Queen">,
      #<Card:0x000000010409fc90 @rank=3, @suit=:spade, @value="3">,
      #<Card:0x00000001042a0828 @rank=14, @suit=:heart, @value="Ace">]>
  end

  # test to see if the player has lost by having no more cards in the deck
  it "deck empty and has lost" do
    expect(@player.has_lost?).to eq(false)
    #pry(main)> @player.has_lost?
    #=> false
  
    expect(@player.deck.remove_card).to eq(@card1)
    #pry(main)> @player.deck.remove_card
    #=> #<Card:0x007f9cc3a73a98 @rank=12, @suit=:diamond, @value="Queen">
    
    expect(@player.has_lost?).to eq(false)
    #pry(main)> @player.has_lost?
    #=> false
    
    expect(@player.deck.remove_card).to eq(@card2)
    #pry(main)> @player.deck.remove_card
    #=> #<Card:0x007f9cc3a03720 @rank=3, @suit=:spade, @value="3">
    
    expect(@player.has_lost?).to eq(false)
    #pry(main)> @player.has_lost?
    #=> false
    
    expect(@player.deck.remove_card).to eq(@card3)
    #pry(main)> @player.deck.remove_card
    #=> #<Card:0x007f9cc3a44c98 @rank=14, @suit=:heart, @value="Ace">
    
    expect(@player.has_lost?).to eq(true)
    #pry(main)> @player.has_lost?
    #=> true
    
    expect(@player.deck.cards).to eq([])
    #pry(main)> @player.deck
    #=> #<Deck:0x007f9cc396bdf8 @cards=[]>
  
  end

end