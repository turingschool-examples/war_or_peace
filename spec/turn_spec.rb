require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require 'pry'


RSpec.describe Turn do

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

        turn =Turn.new(player1, player2)
  
        expect(turn).to be_an_instance_of(Turn)
        
    end

    it "has 3 readable attributes: player1, player2, and spoils_of_war" do

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

        turn =Turn.new(player1, player2)

        expect(turn.player1).to eq(player1)
        expect(turn.player2).to eq(player2)
        expect(turn.spoils_of_war).to eq([])
    end

    it "has type of turn ':basic'" do

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

        expect(player1.deck.rank_of_card_at(0)).not_to eq (player2.deck.rank_of_card_at(0))

        expect(turn.type).to eq(:basic)

    end

    it "has type of turn 'war'" do

        card1 = Card.new(:heart, '10', 10)
        card2 = Card.new(:spade, '10', 10)
        card3 = Card.new(:diamond, '10', 10)
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

        expect(player1.deck.rank_of_card_at(0)).to eq (player2.deck.rank_of_card_at(0))

        expect(turn.type).to eq(:war)

    end

    it "has type of turn 'mutually_assured_destruction" do

        card1 = Card.new(:heart, '10', 10)
        card2 = Card.new(:spade, '10', 10)
        card3 = Card.new(:diamond, '10', 10)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, 'Queen', 12)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])


        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(player1.deck.rank_of_card_at(0)).to eq (player2.deck.rank_of_card_at(0))

        expect(player1.deck.rank_of_card_at(2)).to eq (player2.deck.rank_of_card_at(2))

        expect(turn.type).to eq(:mutually_assured_destruction)

    end

    it "determines the winner if turn type is ':basic'" do

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

        expect(turn.winner).to eq(player1)

    end

    it "determines winner if type of turn is ':war'" do

        card1 = Card.new(:heart, '10', 10)
        card2 = Card.new(:spade, '10', 10)
        card3 = Card.new(:diamond, '10', 10)
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

        expect(turn.type).to eq(:war)

        expect(turn.winner).to eq(player2)

    end

    it "determines draw if turn type is 'mutually_assured_destruction" do

        card1 = Card.new(:heart, '10', 10)
        card2 = Card.new(:spade, '10', 10)
        card3 = Card.new(:diamond, '10', 10)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, 'Queen', 12)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])


        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:mutually_assured_destruction)

        expect(turn.winner).to eq(nil)

    end

    it "for :basic turns it moves top card in each deck to spoils pile" do

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

        turn =Turn.new(player1, player2)

        expect(turn.type).to eq(:basic)

        turn.pile_cards

        expect(player1.deck.cards).to eq([card2, card5, card8])
        expect(player2.deck.cards).to eq([card4, card6, card7])
        
        expect(turn.spoils_of_war).to include(card1, card3)
        #^include works better for the following tests to avoid the need to worry about card order while checking

    end

    it "for :war turns it moves top 3 cards in each deck to spoils pile" do

        card1 = Card.new(:heart, '10', 10)
        card2 = Card.new(:spade, '10', 10)
        card3 = Card.new(:diamond, '10', 10)
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

        expect(turn.type).to eq(:war)


        turn.pile_cards

        expect(turn.spoils_of_war).to include(card1, card2, card5, card3, card4, card6)
        #include would be better to avoid having to worry about order
    end

    it "for :mutually_assured_destruction turns three cards from each deck are just removed" do

        card1 = Card.new(:heart, '10', 10)
        card2 = Card.new(:spade, '10', 10)
        card3 = Card.new(:diamond, '10', 10)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, 'Queen', 12)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])


        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:mutually_assured_destruction)


        turn.pile_cards

        expect(deck1.cards).to eq ([card8])
        expect(deck2.cards).to eq ([card7])

        expect(turn.spoils_of_war).not_to include(card1, card2, card3, card4, card5, card6)

    end

    it "awards cards in the spoils of war to winner of a turn" do


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

        turn.pile_cards
    
        expect(turn.winner).to eq(player2)

        turn.award_spoils

        expect(turn.player2.deck.cards).to include(card1, card3, card4, card6, card7)

        expect(turn.spoils_of_war).to eq([])

    end


end


#binding.pry

