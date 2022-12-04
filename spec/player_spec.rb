require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
    
    before  do
       @card1 = Card.new(:diamond, 'Queen', 12)
       @card2 = Card.new(:spade, '3', 3)   
       @card3 = Card.new(:heart, 'Ace', 14)
       @cards = [@card1, @card2, @card3]    
 
       @deck = Deck.new(@cards)
       @player = Player.new('Clarisa', @deck)
    end

    it "has a name and a deck" do 
        expect(@player.name).to eq('Clarisa')
        expect(@player.deck).to eq(@deck)
    end

    it "has not lost by default" do 

        expect(@player.has_lost?).to be(false)
    end

    it "has lost if it has no cards" do 
        cards = []
        deck = Deck.new(cards)
        player = Player.new('Clarisa', deck)

        expect(player.has_lost?).to eq(true)
    end

    it "can remove a card" do 
        expect(@player.deck.remove_card).to eq(@card1)
        expect(@player.deck.cards).to eq([@card2, @card3])
        expect(@player.has_lost?).to be(false)

        expect(@player.deck.remove_card).to eq(@card2)
        expect(@player.deck.cards).to eq([@card3])
        expect(@player.has_lost?).to be(false)

        expect(@player.deck.remove_card).to eq(@card3)
        expect(@player.deck.cards).to eq([])
        expect(@player.has_lost?).to be(true)

    end




end