
 require './lib/card'
 require './lib/deck'
 require './lib/player'
 require './lib/turn'

RSpec.describe Turn do 
    before do 
        @card1 = Card.new(:heart, 'Jack', 11)
        @card2 = Card.new(:heart, '10', 10)
        @card3 = Card.new(:heart, '9', 9)
        @card4 = Card.new(:diamond, 'Jack', 11)
        @card5 = Card.new(:heart, '8', 8)
        @card6 = Card.new(:diamond, 'Queen', 12)
        @card7 = Card.new(:heart, '3', 3) 
        @card8 = Card.new(:diamond, '2', 2)
        @card9 = Card.new(:spade, 'Jack', 11)
        @card10 = Card.new(:spade, '8', 8)
       

        @deck1 = Deck.new([@card1, @card2, @card5, @card8])
        @deck2 = Deck.new([@card3, @card4, @card6, @card7]) 

        @player1 = Player.new("Megan", @deck1)
        @player2 = Player.new("Aurora", @deck2)

        @turn = Turn.new(@player1, @player2)
    end

    it "exists" do 

        expect(@turn).to be_an_instance_of(Turn)
        expect(@turn.player1.name).to eq("Megan")
        expect(@turn.player2.name).to eq("Aurora")
    end

    it "spoils of war" do

        expect(@turn.spoils_of_war).to eq([])
    end

    it "determines a basic turn type" do 

        expect(@turn.type).to eq(:basic)
    end
    
    
    it "dertermines a war turn type" do 
        deck1 = Deck.new([@card1, @card2, @card5, @card8])
        deck2 = Deck.new([@card9, @card4, @card6, @card7]) 
        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)
        
        turn = Turn.new(player1, player2)
        
        expect(turn.type).to eq(:war)
    end

    it "determines a mututally assured destruction turn type" do
        deck1 = Deck.new([@card1, @card2, @card5, @card8])
        deck2 = Deck.new([@card9, @card4, @card10, @card7]) 
        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)
        
        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:mututally_assured_destruction)
    end
    
    it "determines the winner of a basic turn" do
        
        expect(@turn.winner).to eq(@player1)
    end

    it "determines the winner of a war turn" do 
        deck1 = Deck.new([@card1, @card2, @card5, @card8])
        deck2 = Deck.new([@card9, @card4, @card6, @card7]) 
        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(turn.winner).to eq(player2)
    end

    it "determines mutually assured destruction" do 
        deck1 = Deck.new([@card1, @card2, @card5, @card8])
        deck2 = Deck.new([@card9, @card4, @card10, @card7]) 
        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(turn.winner).to eq("No Winner")
    end

    it "can pile cards for basic turn type" do 

        @turn.pile_cards
        expect(@turn.spoils_of_war).to eq([@card1, @card3])
        expect(@deck1.cards).to eq([@card2, @card5, @card8])
        expect(@deck2.cards).to eq([@card4, @card6, @card7])
    end

    it "can pile cards for war turn type" do 
        deck1 = Deck.new([@card1, @card2, @card5, @card8])
        deck2 = Deck.new([@card9, @card4, @card6, @card7]) 
        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        turn.pile_cards
        expect(turn.spoils_of_war).to eq([@card1, @card2, @card5, @card9, @card4, @card6])
        expect(deck1.cards).to eq([@card8])
        expect(deck2.cards).to eq([@card7])
    end


end