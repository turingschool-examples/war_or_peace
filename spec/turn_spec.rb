require 'rspec'
require 'pry'
require '../lib/turn'

RSpec.describe Turn do 
    it 'has a basic turn' do
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

        expect(player1.name).to eq('Megan')
        expect(turn.player1).to eq(player1)
        expect(turn.player2).to eq(player2)
        expect(turn.spoils_of_war).to eq([])
        expect(turn.type).to eq (:basic)

        winner = turn.winner

        expect(winner).to eq(player1)

        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3])

        turn.award_spoils(winner)
        expect(player1.deck.cards.include?(card3)).to eq(true)
        expect(player2.deck.cards.include?(card3)).to eq(false)
    end

    it 'has a war turn' do 
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
        winner = turn.winner
        expect(winner).to eq(player2)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
        turn.award_spoils(winner)
        expect(deck2.cards.all? { |card| [card7, card1, card2, card5, card4, card3, card6].include?(card) }).to eq(true)
        expect(deck1.cards.include?(card4)).to eq(false)
    end 

    it 'has a mutually assured destruction turn' do 
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
        expect(turn.winner).to eq('No winner')

        turn.pile_cards
        expect(turn.spoils_of_war).to eq([])

        expect(player1.deck.cards).to eq([card8])
        expect(player2.deck.cards).to eq([card7])
    end 
    
    it 'wont error if player has < 3 cards' do
        card1 = Card.new(:heart, 'Jack', 11) 
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9) 
        card4 = Card.new(:diamond, 'Jack', 11)
        deck1 = Deck.new([card1, card2])
        deck2 = Deck.new([card4, card3])
        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)
        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:redo)
    end


end 








