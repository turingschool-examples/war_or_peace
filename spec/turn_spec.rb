require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
    it "can have a basic turn" do
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
        #require 'pry'; binding.pry
        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)
        #require 'pry'; binding.pry
        turn = Turn.new(player1, player2)
        
        #require 'pry'; binding.pry
        expect(turn.player1).to eq(player1)
        expect(turn.player2).to eq(player2)
        expect(turn.spoils_of_war).to eq([])
        expect(turn.type).to eq(:basic)
    end

    it "can have a winner" do
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
        expect(turn.player2).to eq(player2)
        #require 'pry'; binding.pry
        expect(turn.spoils_of_war).to eq([])
        expect(turn.type).to eq(:basic)

        expect(turn.winner).to eq(player1)
        #require 'pry'; binding.pry
        winner = turn.winner
        expect(turn.pile_cards).to eq([card1, card3])
        expect(turn.spoils_of_war).to eq([card1, card3])

        turn.award_spoils(winner)

        expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
        expect(player2.deck.cards).to eq([card4, card6, card7]) 

    end
    
    # it "can lose" do
    #     card1 = Card.new(:diamond, 'Queen', 12)
    #     card2 = Card.new(:spade, '3', 3)
    #     card3 = Card.new(:heart, 'Ace', 14)
    #     cards = [card1, card2, card3]
        
    #     deck = Deck.new(cards)
    #     player = Player.new('Caleb', deck)
        
        
    #     expect(player.deck.remove_card).to eq(card1)
    #     expect(player.has_lost?).to eq(false)
    #     #require 'pry'; binding.pry
    #     expect(player.deck.remove_card).to eq(card2)
    #     expect(player.has_lost?).to eq(false)
    #     expect(player.deck.remove_card).to eq(card3)
    #     expect(player.has_lost?).to eq(true)
    #     expect(player.deck).to eq(deck) 
    # end
 end