require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Player do
    #this tests all methods of turn if the turn type is basic. 
    # winner should be player 1 since card1 has a heigher rank than card 3
    describe 'basic turn' do
        # set up the decks and the turn for all basic tests
        before :each do
            #this will be deck 1
            @card1 = Card.new(:heart, 'Jack', 11)
            @card2 = Card.new(:heart, '10', 10) 
            @card5 = Card.new(:heart, '8', 8) 
            @card8 = Card.new(:diamond, '2', 2) 

            #this will be deck 2
            @card3 = Card.new(:heart, '9', 9)  
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card6 = Card.new(:diamond, 'Queen', 12)
            @card7 = Card.new(:heart, '3', 3)

            @deck1 = Deck.new([@card1, @card2, @card5, @card8])
            @deck2 = Deck.new([@card3, @card4, @card6, @card7])

            @player1 = Player.new('V', @deck1)
            @player2 = Player.new('Michelle', @deck2)

            @turn = Turn.new(@player1, @player2) 
        end

        it "exists and has readable attributies" do
        
            expect(@turn).to be_an_instance_of(Turn)
            expect(@turn.player1).to eq(@player1)
            expect(@turn.player2).to eq(@player2)
            expect(@turn.spoils_of_war).to eq([])
        end

        it "check turn type" do
            expect(@turn.type).to eq(:basic)
        end

        it "winner" do
            expect(@turn.winner).to eq(@player1)
        end 

        it "pile cards and award spoils" do
            # we must store the winner before piling cards. If we pile cards first, it will delete 
            # cards from the deck and we will no longer be able to find the correct winner
            
            winner = @turn.winner
            @turn.pile_cards
            #check that the correct cards have been moved to the spoils of war array
            expect(@turn.spoils_of_war).to eq([@card1,@card3])
            
            @turn.award_spoils(winner)
            # check that the spoils are appropriatly rewarded to the winner
            expect(@player1.deck.cards).to eq ([@card2, @card5, @card8,@card1,@card3])
            expect(@player2.deck.cards).to eq ([@card4, @card6, @card7])
        end

    end 


    describe 'war turn' do
        # this tests all methods of turn if the turn type is war.
        # in this example player 2 should be the winner since card 6 is a larger rank than card 5
        
        # set up the deck for all war turn tests
        before :each do
            #this will be deck 1 
            @card1 = Card.new(:heart, 'Jack', 11)
            @card2 = Card.new(:heart, '10', 10) 
            @card5 = Card.new(:heart, '8', 8) 
            @card8 = Card.new(:diamond, '2', 2) 

            #this will be deck 2  
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card3 = Card.new(:heart, '9', 9)
            @card6 = Card.new(:diamond, 'Queen', 12)
            @card7 = Card.new(:heart, '3', 3)

            @deck1 = Deck.new([@card1, @card2, @card5, @card8])
            @deck2 = Deck.new([ @card4,@card3, @card6, @card7])

            @player1 = Player.new('V', @deck1)
            @player2 = Player.new('Michelle', @deck2)

            @turn = Turn.new(@player1, @player2) 
        end

        it "exists and has readable attributies" do
        
            expect(@turn).to be_an_instance_of(Turn)
            expect(@turn.player1).to eq(@player1)
            expect(@turn.player2).to eq(@player2)
            expect(@turn.spoils_of_war).to eq([])
        end

        it "check turn type" do
            expect(@turn.type).to eq(:war)
        end

        it "winner" do
            expect(@turn.winner).to eq(@player2)
        end 

        it "pile cards and award spoils" do
            # we must store the winner before piling cards. If we pile cards first, it will delete 
            # cards from the deck and we will no longer be able to find the correct winner
            winner = @turn.winner
            @turn.pile_cards
            #check that the correct cards have been moved to the spoils of war array
            expect(@turn.spoils_of_war).to eq([@card1, @card2, @card5,@card4,@card3, @card6])
            
            @turn.award_spoils(winner)
            
            # check that the spoils are appropriatly rewarded to the winner
            expect(@player1.deck.cards).to eq ([@card8])
            expect(@player2.deck.cards).to eq ([@card7, @card1, @card2, @card5,@card4,@card3, @card6])


        end 
    end

    describe 'mutually assured distruction turn' do
        # this tests all methods of turn if the turn type is :mutually_assured_destruction.
        # in this example there is no winner since the 1st and 3rd cards in each deck are the same rank
        
        # set up the deck for all :mutually_assured_destruction turn tests
        before :each do
            #this will be deck 1 
            @card1 = Card.new(:heart, 'Jack', 11)
            @card2 = Card.new(:heart, '10', 10) 
            @card5 = Card.new(:heart, '8', 8) 
            @card8 = Card.new(:diamond, '2', 2) 

            #this will be deck 2  
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card3 = Card.new(:heart, '9', 9)
            @card6 = Card.new(:diamond, '8', 8)
            @card7 = Card.new(:heart, '3', 3)

            @deck1 = Deck.new([@card1, @card2, @card5, @card8])
            @deck2 = Deck.new([@card4, @card3, @card6, @card7])

            @player1 = Player.new('V', @deck1)
            @player2 = Player.new('Michelle', @deck2)

            @turn = Turn.new(@player1, @player2) 
        end

        it "exists and has readable attributies" do
        
            expect(@turn).to be_an_instance_of(Turn)
            expect(@turn.player1).to eq(@player1)
            expect(@turn.player2).to eq(@player2)
            expect(@turn.spoils_of_war).to eq([])
        end

        it "check turn type" do
            expect(@turn.type).to eq(:mutually_assured_destruction)
        end

        it "winner" do
            expect(@turn.winner).to eq("No Winner")
        end 

        it "pile cards and award spoils" do
            # we must store the winner before piling cards. If we pile cards first, it will delete 
            # cards from the deck and we will no longer be able to find the correct winner
            winner = @turn.winner
            @turn.pile_cards
            #check that the correct cards have been moved to the spoils of war array
            expect(@turn.spoils_of_war).to eq([])
            
            @turn.award_spoils(winner)

            # check that the spoils are appropriatly rewarded to the winner
            expect(@player1.deck.cards).to eq ([@card8])
            expect(@player2.deck.cards).to eq ([@card7])


        end 

    end

    

# this was  test I considered to check for special cases. 
# I will come back to this later
    xit "check turn type works if less than 3 cards" do
        expect(@turn.type).to eq(:basic)
        
        
            @deck2.cards.delete_at(0)
            @deck2.cards.delete_at(0)
            # binding.pry
        expect(@turn.type).to eq(:war)

        

    end

    
    
end