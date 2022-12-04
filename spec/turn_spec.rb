require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do

    # Learned about this technique but couldn't get it to work quite yet.
    # before do
        # @card1 = Card.new(:heart, 'Jack', 11)
        # @card2 = Card.new(:heart, '10', 10)    
        # @card3 = Card.new(:heart, '9', 9) 
        # @card4 = Card.new(:diamond, 'Jack', 11) 
        # @card5 = Card.new(:heart, '8', 8)
        # @card6 = Card.new(:diamond, 'Queen', 12) 
        # @card7 = Card.new(:heart, '3', 3)
        # @card8 = Card.new(:diamond, '2', 2)    

        # @deck1 = Deck.new([@card1, @card2, @card5, @card8])  
        # @deck2 = Deck.new([@card3, @card4, @card6, @card7])

        # @player1 = Player.new("Megan", @deck1)    
        # @player2 = Player.new("Aurora", @deck2)  
        
        # @turn = Turn.new(@player1, @player2)
    # end

    describe ":basic turn type" do
        it "exsists" do
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
        end

        it "turn.player1 should show player name and deck" do
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

            expect(turn.player1).to eq(player1)
        end

        it "turn.player2 should show player name and deck" do
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

            expect(turn.player2).to eq(player2)
        end

        it "turn.spoils_of_war should show empty array" do
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

        it "turn.type should be :basic " do
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

            expect(turn.type).to eq(:basic)
        end
   
        it "winner should show player1" do
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
            winner = turn.winner

            expect(winner).to eq(player1)
        end

        # turn.pile cards needs a test? (no grey return information in iteraction pattern)

        it "turn.spoils_of_war should hold two cards(card1, card3)" do
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
            winner = turn.winner
            turn.pile_cards

            expect(turn.spoils_of_war).to eq([card1, card3])
        end

        # turn.award_spoils(winner) need a test? (no grey return information in iteraction pattern)

        it "player1.deck.cards should show cards in deck1" do
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
            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)

            expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
        end

        it "player2.deck.cards should show cards left in deck2" do
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
            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)

            expect(player2.deck.cards).to eq([card4, card6, card7])
        end
    end 
     
    describe ":war turn type" do
        it "turn.type should be :war" do
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

            expect(turn.type).to eq(:war)
        end 

        it "winner should show player2" do
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
            winner = turn.winner

            expect(winner).to eq(player2)
        end 

        # turn.pile cards needs a test? (no grey return information in iteraction pattern)

        it "turn.spoils_of_war should show cards were added to winner deck" do
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
            winner = turn.winner
            turn.pile_cards

            expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])
        end 
        
        # turn.award_spoils(winner) need a test? (no grey return information in iteraction pattern)

        it "player1.deck.cards should show 1 card left in deck1" do
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
            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)

            expect(player1.deck.cards).to eq([card8])
        end 

        it "player2.deck.cards should show 7 cards in deck2" do
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
            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)

            expect(player2.deck.cards).to eq([card7, card1, card4, card2, card3, card5, card6])
        end 
    end
     
    describe ":mutually_assured_destruction" do
        it "turn.type should be :mutually_assured_destruction" do
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

            expect(turn.type).to eq(:mutually_assured_destruction)
        end

        it "winner should return 'No Winner'" do
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
            winner = turn.winner

            expect(winner).to eq("No Winner")
        end

        # turn.pile cards needs a test? (no grey return information in iteraction pattern)

        it "turn.spoils_of_war should show empty deck(empty array)" do        
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
            winner = turn.winner
            turn.pile_cards

            expect(turn.spoils_of_war).to eq([])
        end

        it "player1.deck.cards should show 1 card left in deck1" do        
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
            winner = turn.winner
            turn.pile_cards

            expect(player1.deck.cards).to eq([card8])
        end

        it "player2.deck.cards should show 1 cards left in deck2" do        
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
            winner = turn.winner
            turn.pile_cards

            expect(player2.deck.cards).to eq([card7])
        end
    end
end
