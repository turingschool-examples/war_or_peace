require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

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

    it "has has type of turn ':basic'" do

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


    # expect(turn.type).to eq(:war)

    # expect(turn.type).to eq(:mutually_assured_destruction)



end
