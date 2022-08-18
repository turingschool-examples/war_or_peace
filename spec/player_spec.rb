require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe do 
  before :each do 
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)    
    @card3 = Card.new(:heart, 'Ace', 14)   
    @deck = Deck.new([@card1, @card2, @card3])
    @player = Player.new('Clarisa', @deck)
  end

  it "exists" do 
    expect(@player).to be_an_instance_of(Player)
  end

  it 'has attributes' do 
    expect(@player.name).to eq("Clarisa")
    expect(@player.deck).to be_an_instance_of(Deck)
  end
    
  it 'can identify if a card has been removed and a player has lost' do   
    expect(@player.has_lost?).to eq(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(false)
    @player.deck.remove_card
    expect(@player.has_lost?).to eq(true)
  end 

  it "can tell how many cards are in a players deck" do 
    @player.deck.remove_card
    @player.deck.remove_card
    expect(@player.deck.cards).to eq(@cards=[@card3])
    @player.deck.remove_card
    expect(@player.deck.cards).to eq(@cards=[])
  end 

end 
