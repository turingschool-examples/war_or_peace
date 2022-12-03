require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

describe Game do
    before(:each) do
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
        
        @player1 = Player.new("Megan", deck1)
        @player2 = Player.new("Aurora", deck2)     

        @game = Game.new(@player1, @player2)
    end

    it 'exists' do
        expect(@game).to be_a(Game)
    end

    it 'has readable attribute' do
        expect(@game.player1).to eq(@player1)
        expect(@game.player2).to eq(@player2)
    end

    it 'can check if game ended' do
        expect(@game.game_ended?).to eq(false)

        @player1 = Player.new("Megan", Deck.new([]))
        @game = Game.new(@player1, @player2)

        expect(@game.game_ended?).to eq(true)
    end

    it 'can play turn' do
        winning_deck = @player1.deck.cards[1..3]
        winning_deck << @player1.deck.cards[0] << @player2.deck.cards[0]

        losing_deck = @player2.deck.cards[1..3]

        @game.play_turn

        expect(@player1.deck.cards).to eq(winning_deck)
        expect(@player2.deck.cards).to eq(losing_deck)
    end
    
    it 'can start game' do
        expect(@game.start).to eq("---- DRAW ----")

        card1 = Card.new(:spade, "2", 2)
        card2 = Card.new(:spade, "3", 3)
        card3 = Card.new(:spade, "4", 4)
        card4 = Card.new(:spade, "5", 5)
        card5 = Card.new(:spade, "6", 6)
        
        @player1 = Player.new("Megan", Deck.new([card5, card4, card3]))
        @player2 = Player.new("Aurora", Deck.new([card2, card1]))
        @game = Game.new(@player1, @player2)

        expect(@game.start).to eq("*~*~*~* Megan has won the game! *~*~*~*")
        
    end
end