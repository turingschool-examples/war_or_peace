require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
describe ':war turn' do
    it 'exists' do
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
        
        expect(turn).to be_an_instance_of(Turn)
    end

    it 'has readable attributes' do
        card1 = Card.new(:heart, 'Jack', 11)
        card4 = Card.new(:heart, '10', 10)  
        card2 = Card.new(:heart, '9', 9)
        card3 = Card.new(:diamond, 'Jack', 11) 
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3) 
        card8 = Card.new(:diamond, '2', 2) 
        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card4, card3, card6, card7])
        player1 = Player.new("Megan", deck1)  
        player2 = Player.new("Aurora", deck2)
        turn = Turn.new(player1, player2)
        
        expect(turn.spoils_of_war).to eq([])
    end

    it 'has turn types' do 
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

    it 'has a winner' do
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

        expect(turn.type).to eq(:war)
        expect(turn.winner).to eq(player2)
    end

    it 'can pile cards into award spoils' do
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

        expect(turn.type).to eq(:war)
        turn.pile_cards
        expect(turn.player1.deck.cards).to eq([card8])
        expect(turn.player2.deck.cards).to eq([card7])
        expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
    end

    it 'can dispense spoils' do
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
        expect(turn.player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
    end
end
end