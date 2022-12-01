require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.descrbe Player do
     before(:each) do
        before(:each) do
       @card1 = Card.new(:diamond, 'Queen', 12)
       @card2 = Card.new(:spade, '3', 3)   
       @card3 = Card.new(:heart, 'Ace', 14)
       @cards = [@card1, @card2, @card3]    
 
       @deck = Deck.new(@cards)
       @player = Player.new('Clarisa', deck)
     end

    it "has a name and a deck" do 
        expect(player.name).to eq('Clarisa')
        expect(player.deck).to eq([@card1, @card2, @card3])
    end

    xit "has not lost by default" do 
        expect(player.has_lost?).to be(false)
    end

    xit "can remove a card" do 
        expect(player.deck.remove_card).to eq(@card1)
        expect(player.deck).to eq([@card2, @card3])
        expect(player.has_lost?).to be(false)

        expect(player.deck.remove_card).to eq(@card2)
        expect(player.deck).to eq([@card3])
        expect(player.has_lost?).to be(false)

        expect(player.deck.remove_card).to eq(@card3)
        expect(player.deck).to eq([])
        expect(player.has_lost?).to be(true)

    end




end