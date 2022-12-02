require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
    it "exists" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2)   
        
        expect(turn).to be_an_instance_of(Turn)
        expect(turn.player1.name).to eq("Megan")
        expect(turn.player2.name).to eq("Aurora")
    end

    it "spoils_of_war" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 

        expect(turn.spoils_of_war).to eq([])
    end

    it "type_basic" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 

        
        expect(turn.type).to be(:basic)

    end

    it "type_war" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card4, card3, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 

        
        expect(turn.type).to be(:war)
    end

    it "type_mutually_assured_destruction" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, '8', 8)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card4, card3, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 

        
        expect(turn.type).to be(:mutually_assured_destruction)
    end

    it "has_a_winner" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2) 
        
        expect(turn.winner).to eq(player1)
    end

    it "pile_cards_basic" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:heart, '9', 9)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3])  
    end

    it "pile_cards_war" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:spade, 'Jack', 11)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, 'Queen', 12)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3, card2, card4, card5, card6])
    end

    it "pile_cards_mutually_destruction" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:spade, 'Jack', 11)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, '8', 8)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2)    

        turn = Turn.new(player1, player2)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([])
    end

    it "award_spoils_of_war_basic" do 
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:spade, '5', 5)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, '8', 8)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card5, card8])    
        deck2 = Deck.new([card3, card4, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2) 


        turn = Turn.new(player1, player2)
        winner = turn.winner
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3])
        turn.award_spoils(winner)
        expect(turn.player1.deck.cards).to eq([card2, card5, card8, card1, card3])
        expect(turn.player2.deck.cards).to eq([card4, card6, card7])
        
    end

    it "award_spoils_of_war_war" do 
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:spade, '5', 5)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:diamond, '8', 8)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card8, card5])    
        deck2 = Deck.new([card4, card3, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2) 


        turn = Turn.new(player1, player2)
        winner = turn.winner
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card8, card6])
        turn.award_spoils(winner)
        expect(turn.player1.deck.cards).to eq([card5]) 
        expect(turn.player2.deck.cards).to eq([card7, card1, card4, card2,card3, card8, card6])   
    end

    it "mutual_destruction" do 
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)    
        card3 = Card.new(:spade, '5', 5)    
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)    
        card6 = Card.new(:heart, '2', 2)    
        card7 = Card.new(:heart, '3', 3)    
        card8 = Card.new(:diamond, '2', 2)    

        deck1 = Deck.new([card1, card2, card8, card5])    
        deck2 = Deck.new([card4, card3, card6, card7])    

        player1 = Player.new("Megan", deck1)    
        player2 = Player.new("Aurora", deck2) 


        turn = Turn.new(player1, player2)
        winner = turn.winner
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([])
        expect(turn.player1.deck.cards).to eq([card5]) 
        expect(turn.player2.deck.cards).to eq([card7])

    end
    


end