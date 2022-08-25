require 'rspec'
require 'pry'
require '../lib/turn'

RSpec.describe Turn do 

    describe ' #initialize' do 
        before(:each) do 
            @card1 = Card.new(:heart, 'Jack', 11)
            @card3 = Card.new(:heart, '9', 9)
            @deck1 = Deck.new([@card1])
            @deck2 = Deck.new([@card3])
            @player1 = Player.new("Megan", @deck1)
            @player2 = Player.new("Aurora", @deck2)
            @turn = Turn.new(@player1, @player2)
        end 
        it 'has two players' do
            expect(@turn.player1).to eq(@player1)
            expect(@turn.player2).to eq(@player2)
        end 

        it 'has a spoils_of_war variable' do 
            expect(@turn.spoils_of_war).to eq([])
        end 
    end 

    describe ' #type' do 
        before(:each) do 
            @card1 = Card.new(:heart, 'Jack', 11) 
            @card2 = Card.new(:heart, '10', 10)
            @card3 = Card.new(:heart, '9', 9) 
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card5 = Card.new(:heart, '8', 8)
            @card6 = Card.new(:diamond, '8', 8)
            @card7 = Card.new(:heart, '3', 3)    
            @card8 = Card.new(:diamond, '2', 2)
        end 

        it 'has a basic turn' do
                deck1 = Deck.new([@card1, @card2, @card5, @card8])
                deck2 = Deck.new([@card3, @card4, @card6, @card7])
                player1 = Player.new("Megan", deck1)
                player2 = Player.new("Aurora", deck2)
                turn = Turn.new(player1, player2)

                expect(turn.type).to eq(:basic)
        end

        it 'has a war turn' do 
            deck1 = Deck.new([@card1, @card2, @card8, @card5])
            deck2 = Deck.new([@card4, @card3, @card6, @card7])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            expect(turn.type).to eq(:war)
        end 

        it 'has a mutually assured destruction turn' do 
            deck1 = Deck.new([@card1, @card2, @card5, @card8])
            deck2 = Deck.new([@card4, @card3, @card6, @card7])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            expect(turn.type).to eq(:mutually_assured_destruction)
        end 
        
        it 'wont error if War and player has < 3 cards' do
            deck1 = Deck.new([@card1, @card2])
            deck2 = Deck.new([@card4, @card3])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            expect(turn.type).to eq(:redo)
        end
    end 

    describe ' #winner' do 
        before(:each) do
            @card1 = Card.new(:heart, 'Jack', 11) 
            @card2 = Card.new(:heart, '10', 10)
            @card3 = Card.new(:heart, '9', 9) 
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card5 = Card.new(:heart, '8', 8)
            @card6 = Card.new(:diamond, '8', 8)
            @card7 = Card.new(:heart, '3', 3)    
            @card8 = Card.new(:diamond, '2', 2)
        end 

        it 'has a basic winner' do
            deck1 = Deck.new([@card1, @card2, @card5, @card8])
            deck2 = Deck.new([@card3, @card4, @card6, @card7])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            expect(turn.winner).to eq(player1)
        end

        it 'has a war winner' do 
            deck1 = Deck.new([@card1, @card2, @card8, @card5])
            deck2 = Deck.new([@card4, @card3, @card6, @card7])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            expect(turn.winner).to eq(player2)
        end 

        it 'returns No winner if MAD' do 
            deck1 = Deck.new([@card1, @card2, @card5, @card8])
            deck2 = Deck.new([@card4, @card3, @card6, @card7])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            expect(turn.winner).to eq('No winner')
        end 
        
        it 'returns redo if turn is a redo' do
            deck1 = Deck.new([@card1, @card2])
            deck2 = Deck.new([@card4, @card3])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            expect(turn.winner).to eq('redo')
        end 
    end 

    describe ' #pile_cards' do 
        before(:each) do
            @card1 = Card.new(:heart, 'Jack', 11) 
            @card2 = Card.new(:heart, '10', 10)
            @card3 = Card.new(:heart, '9', 9) 
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card5 = Card.new(:heart, '8', 8)
            @card6 = Card.new(:diamond, '8', 8)
            @card7 = Card.new(:heart, '3', 3)    
            @card8 = Card.new(:diamond, '2', 2)
        end 

        it 'puts cards on bottom of deck if redo' do 
            deck1 = Deck.new([@card1, @card2])
            deck2 = Deck.new([@card4, @card3])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            turn.pile_cards
            expect(deck1.cards.last).to eq(@card1)
            expect(deck2.cards.last).to eq(@card4)
        end 

        it 'puts top cards in spoils if basic' do 
            deck1 = Deck.new([@card1, @card2, @card5, @card8])
            deck2 = Deck.new([@card3, @card4, @card6, @card7])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            turn.pile_cards
            expect(turn.spoils_of_war).to eq([@card1, @card3])  
        end 

        it 'puts top 3 cards in spoils if war' do 
            deck1 = Deck.new([@card1, @card2, @card8, @card5])
            deck2 = Deck.new([@card4, @card3, @card6, @card7])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)
            
            turn.pile_cards
            expect(turn.spoils_of_war).to eq([@card1, @card2, @card8, @card4, @card3, @card6])
        end 

        it 'puts nothing in spoils if MAD' do 
            deck1 = Deck.new([@card1, @card2, @card5, @card8])
            deck2 = Deck.new([@card4, @card3, @card6, @card7])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            turn.pile_cards
            expect(turn.spoils_of_war).to eq([])
        end 
    end 
    
    describe ' #award_spoils' do 
        before(:each) do
            @card1 = Card.new(:heart, 'Jack', 11) 
            @card2 = Card.new(:heart, '10', 10)
            @card3 = Card.new(:heart, '9', 9) 
            @card4 = Card.new(:diamond, 'Jack', 11)
            @card5 = Card.new(:heart, '8', 8)
            @card6 = Card.new(:diamond, '8', 8)
            @card7 = Card.new(:heart, '3', 3)    
            @card8 = Card.new(:diamond, '2', 2)
        end                 
        
        it 'awards card spoils to winner' do
            deck1 = Deck.new([@card1, @card2, @card5, @card8])
            deck2 = Deck.new([@card3, @card4, @card6, @card7])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)
            
            winner = turn.winner 
            turn.pile_cards
            turn.award_spoils(winner)
            expect(deck1.cards.include?(@card1)).to eq(true)
            expect(deck1.cards.include?(@card3)).to eq(true)  
            expect(deck2.cards.include?(@card3)).to eq(false)
        end

        it 'removes cards from play if MAD' do 
            deck1 = Deck.new([@card1, @card2, @card5, @card8])
            deck2 = Deck.new([@card4, @card3, @card6, @card7])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)
            expect(deck1.cards).to eq([@card8])
            expect(deck2.cards).to eq([@card7])
        end 

        it 'returns cards to decks if redo' do 
            deck1 = Deck.new([@card1, @card2])
            deck2 = Deck.new([@card4, @card3])
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
            turn = Turn.new(player1, player2)

            winner = turn.winner
            turn.pile_cards
            turn.award_spoils(winner)

            expect(deck1.cards).to eq([@card2, @card1])
            expect(deck2.cards).to eq([@card3, @card4])
        end 
    end 
end 








