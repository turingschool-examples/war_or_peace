require 'rspec'
require './lib/deck'
require './lib/card'
require './lib/player'
require './lib/turn'
require 'pry'

RSpec.describe Player do
    before :each do
        @card1 = Card.new(:diamond, 'Queen', 12)
        @card2 = Card.new(:spade, '3', 3) 
        
        @card3 = Card.new(:heart, 'Ace', 14)  
        @card4 = Card.new(:diamond, 'Jack', 11) 

        @card5 = Card.new(:heart, '8', 8)  
        @card6 = Card.new(:diamond, 'Queen', 12) 
        
        @card7 = Card.new(:heart, '3', 3) 
        @card8 = Card.new(:diamond, '2', 2)     
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
        
        
        cards_a=[@card1,@card2,@card3]
        deck_a = Deck.new(cards_a)
        cards_b = [@card6,@card5,@card4]
        deck_b = Deck.new(cards_b)
        player_a = Player.new('Va', deck_a)
        player_b = Player.new('M', deck_b)
        turn2 = Turn.new(player_a, player_b) 

        expect(turn2.type).to eq(:war)

        cards_c=[@card1,@card2,@card3]
        deck_c = Deck.new(cards_c)
        deck_d = Deck.new(cards_c)
        player_c = Player.new('Va', deck_c)
        player_d = Player.new('M', deck_d)
        
        turn2 = Turn.new(player_c, player_d) 
        
        expect(turn2.type).to eq(:mutually_assured_destruction)

    end

    it "check turn type works if less than 3 cards" do
        expect(@turn.type).to eq(:basic)
        
        
            @deck2.cards.delete_at(0)
            @deck2.cards.delete_at(0)
            # binding.pry
        expect(@turn.type).to eq(:war)

        

    end

    it "winner" do
        expect(@turn.winner).to eq(@player2)

        cards_a=[@card1,@card2,@card3]
        deck_a = Deck.new(cards_a)
        cards_b = [@card6,@card5,@card4]
        deck_b = Deck.new(cards_b)
        player_a = Player.new('Va', deck_a)
        player_b = Player.new('M', deck_b)
        turn2 = Turn.new(player_a, player_b) 
        expect(turn2.winner).to eq(player_a)

        cards_c=[@card1,@card2,@card3]
        deck_c = Deck.new(cards_c)
        deck_d = Deck.new(cards_c)
        player_c = Player.new('Va', deck_c)
        player_d = Player.new('M', deck_d)
        
        turn2 = Turn.new(player_c, player_d) 
        
        expect(turn2.winner).to eq("No Winner")
    end
    
    it "pile_cards" do
        #turn is basic
        #player 2 should win
        @turn.pile_cards
        expect(@turn.spoils_of_war).to eq([@card1,@card3])
        
        #turn type is war
        # winner should be player a

        cards_a=[@card1,@card2,@card3]
        deck_a = Deck.new(cards_a)
        cards_b = [@card6,@card5,@card4]
        deck_b = Deck.new(cards_b)
        player_a = Player.new('Va', deck_a)
        player_b = Player.new('M', deck_b)
        turn2 = Turn.new(player_a, player_b) 
        turn2.pile_cards
        expect(turn2.spoils_of_war).to eq([@card1,@card2,@card3,@card6,@card5,@card4])
        
        #turn type should be mutual distruction
        cards_c=[@card1,@card2,@card3]
        deck_c = Deck.new(cards_c)
        deck_d = Deck.new(cards_c)
        player_c = Player.new('Va', deck_c)
        player_d = Player.new('M', deck_d)
        
        turn2 = Turn.new(player_c, player_d) 
        turn2.pile_cards
        expect(turn2.spoils_of_war).to eq([])
    end

        it "pile_cards" do
        #turn is basic
        #player 2 should win
        @turn.pile_cards
        @turn.award_spoils
        expect(@turn.spoils_of_war).to eq([@card1,@card3])
        
         #turn type is war
        # winner should be player a

        cards_a=[@card1,@card2,@card3]
        deck_a = Deck.new(cards_a)
        cards_b = [@card6,@card5,@card4]
        deck_b = Deck.new(cards_b)
        player_a = Player.new('Va', deck_a)
        player_b = Player.new('M', deck_b)
        turn2 = Turn.new(player_a, player_b) 
        turn2.pile_cards
        turn2.award_spoils
        #binding.pry
        expect(turn2.player1.deck.cards).to eq([@card1,@card2,@card3,@card6,@card5,@card4])
        expect(turn2.player2.deck.cards).to eq([])
        
        #turn type should be mutual distruction
        cards_c=[@card1,@card2,@card3]
        deck_c = Deck.new(cards_c)
        deck_d = Deck.new(cards_c)
        player_c = Player.new('Va', deck_c)
        player_d = Player.new('M', deck_d)
        
        turn2 = Turn.new(player_c, player_d) 
        
        turn2.pile_cards
        turn2.award_spoils
        expect(turn2.player1.deck.cards).to eq([])
        expect(turn2.player2.deck.cards).to eq([])
        expect(turn2.spoils_of_war).to eq([])
    end
    
end