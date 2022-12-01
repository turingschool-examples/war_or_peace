require './lib/card'
require './lib/deck'
require './lib/player'
require 'rspec'

describe Player do 
    describe 'happy paths' do 
        it 'the player has a name' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            
        expect(player.name).to eq("Clarisa")
    end 
        
        it 'our player starts out not a loser' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            player.deck
            

        expect(player.has_lost?).to be false 
        
    end

        it 'our player does not lose after removing one card' do 
            card1 = Card.new(:diamond, 'Queen', 12)
            card2 = Card.new(:spade, '3', 3)
            card3 = Card.new(:heart, 'Ace', 14)
            deck = Deck.new([card1, card2, card3])
            player = Player.new('Clarisa', deck)
            player.deck
            player.deck.remove_card

        expect(player.has_lost?).to be false 
        end 




    end

















end