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

    it "shows spoils_of_war" do
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

    it "shows type of turn (basic, war, or MAD)" do
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

    it "determines turn winner" do
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

    it "makes a pile_cards" do
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

    it "gives award_spoils to winner" do
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

    it "adds :war turn type" do
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

    it "shows spoils_of_war for :war turn type" do
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
        # turn.award_spoils(winner)

        # expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
        expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])

    end 




    # require "pry"; binding.pry
end
