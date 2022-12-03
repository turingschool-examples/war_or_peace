require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
    it 'exists and has attributes' do
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
        expect(turn.player1).to eq(player1)
        expect(turn.player2).to eq(player2)
        
        expect(turn.spoils_of_war).to eq([])


    end

    it 'takes a turn' do
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

   it 'has a turn winner' do
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
        # turn.pile_cards
        # expect(turn.spoils_of_war).to eq([card1, card3])
        # # require "pry"; binding.pry
        # turn.award_spoils(turn.winner)
        # expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
        # expect(turn.type).to eq(:basic)
        
    end
    
    it 'awards spoils of war' do
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
        expect(turn.type).to eq(:basic)
        expect(turn.winner).to eq(player1)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3])
        turn.award_spoils(winner)
        expect(player1.deck.cards).to include(card2, card5, card8, card1, card3)
    end

    it 'it can be war' do
        card1 = Card.new(:heart, 'Jack', 11) 
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:club, 'Jack', 11)
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
        expect(turn.type).to eq(:war)
        turn.pile_cards
        turn.award_spoils(winner)
        # require "pry"; binding.pry
        expect(player2.deck.cards).to include(card1, card2, card3, card4, card5, card6, card7)
    end

    it 'it can be mutually assured destruction' do
        card1 = Card.new(:heart, 'Jack', 11) 
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:club, 'Jack', 11)
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
        # winner = turn.winner
        expect(turn.type).to eq(:mutually_assured_destruction)
        turn.pile_cards
        # turn.award_spoils(winner)
        # require "pry"; binding.pry
        expect(player2.deck.cards).to include(card7)
        expect(player1.deck.cards).to include(card8)

    end
end