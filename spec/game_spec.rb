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
        expect(@game.play_turn).to eq(@player1)
    end
    
    it 'can start game ending with basic turn' do
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

    it 'can start game ending with war/mad turn' do
        card1 = Card.new(:diamond, "2", 2)
        card2 = Card.new(:heart, "2", 2)
        card3 = Card.new(:spade, "2", 2)
        card4 = Card.new(:club, "2", 2)
        card5 = Card.new(:spade, "Ace", 14)
        @player1 = Player.new("Megan", Deck.new([card1, card2, card5]))
        @player2 = Player.new("Aurora", Deck.new([card3, card4]))
        @game = Game.new(@player1, @player2)
        
        expect(@game.start).to eq("*~*~*~* Megan has won the game! *~*~*~*")
    end

    it 'can start game ending with draw before max turn count' do
        card1 = Card.new(:diamond, "2", 2)
        card2 = Card.new(:heart, "2", 2)
        card3 = Card.new(:spade, "2", 2)
        card4 = Card.new(:club, "2", 2)
        @player1 = Player.new("Megan", Deck.new([card1, card2]))
        @player2 = Player.new("Aurora", Deck.new([card3, card4]))
        @game = Game.new(@player1, @player2)

        expect(@game.start).to eq("---- DRAW ----")
    end

    it 'can announce basic winner' do 
        expect(@game.announce_winner(@game.play_turn)).to eq("Turn 1: Megan won 2 cards")
    end

    it 'can announce war winner' do
        card1 = Card.new(:spade, "2", 2)
        card2 = Card.new(:spade, "3", 3)
        card3 = Card.new(:spade, "4", 4)
        card4 = Card.new(:heart, "2", 2)
        card5 = Card.new(:heart, "3", 3)
        card6 = Card.new(:heart, "5", 5)
        card7 = Card.new(:spade, "6", 6)
        card8 = Card.new(:heart, "7", 7)

        @player1 = Player.new("Megan", Deck.new([card1, card2, card3, card7]))
        @player2 = Player.new("Aurora", Deck.new([card4, card5, card6, card8]))
        @game = Game.new(@player1, @player2)

        expect(@game.announce_winner(@game.play_turn)).to eq("Turn 1: WAR - Aurora won 6 cards")
    end

    it 'can announce mutually assured destruction' do
        card1 = Card.new(:spade, "2", 2)
        card2 = Card.new(:spade, "3", 3)
        card3 = Card.new(:spade, "4", 4)
        card4 = Card.new(:heart, "2", 2)
        card5 = Card.new(:heart, "3", 3)
        card6 = Card.new(:heart, "4", 4)
        card7 = Card.new(:spade, "6", 6)
        card8 = Card.new(:heart, "7", 7)

        @player1 = Player.new("Megan", Deck.new([card1, card2, card3, card7]))
        @player2 = Player.new("Aurora", Deck.new([card4, card5, card6, card8]))
        @game = Game.new(@player1, @player2)

        expect(@game.announce_winner(@game.play_turn)).to eq("Turn 1: *mutually assured destruction* 6 cards removed from play")
    end

end