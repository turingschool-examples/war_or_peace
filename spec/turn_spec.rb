require './lib/turn'
require 'pry'




describe Turn do

   

    describe '#initialize' do
        it 'is a turn' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        cards = [card1, card2, card3]
        deck = Deck.new(cards)
        player = Player.new('Zach', deck)
        end
    end


    describe '#type' do
        it 'tells basic type' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:diamond, 'King', 13)
        card5 = Card.new(:spade, '7', 7)
        card6 = Card.new(:heart, 'Jack', 11)
        cards1 = [card1, card3, card5]
        cards2 = [card2, card4, card6]
        deck1 = Deck.new(cards1)
        deck2 = Deck.new(cards2)
        player1 = Player.new('Zach', deck1)
        player2 = Player.new('Notzach', deck2)
        turn = Turn.new(player1, player2)
        expect(turn.type).to eq :basic
        end
    end

    describe '#type' do
        it 'tells mutually_assured_destruction type' do
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
        expect(turn.type).to eq :mutually_assured_destruction
        end
    end

    describe '#winner' do
        it 'tells the winner' do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:diamond, 'King', 13)
        card5 = Card.new(:spade, '7', 7)
        card6 = Card.new(:heart, 'Jack', 11)
        cards1 = [card1, card3, card5]
        cards2 = [card2, card4, card6]
        deck1 = Deck.new(cards1)
        deck2 = Deck.new(cards2)
        player1 = Player.new('Zach', deck1)
        player2 = Player.new('Notzach', deck2)
        turn = Turn.new(player1, player2)
        expect(turn.winner).to eq player1
        end
    end

    describe '#pile_cards(basic)' do
        it "Piles the cards for basic" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:spade, '3', 3)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:diamond, 'King', 13)
        card5 = Card.new(:spade, '7', 7)
        card6 = Card.new(:heart, 'Jack', 11)
        cards1 = [card1, card3, card5]
        cards2 = [card2, card4, card6]
        deck1 = Deck.new(cards1)
        deck2 = Deck.new(cards2)
        player1 = Player.new('Zach', deck1)
        player2 = Player.new('Notzach', deck2)
        turn = Turn.new(player1, player2)
        expect(turn.pile_cards).to eq [card1, card2]
        end
    end

    describe '#pile_cards(war)' do
        it "Piles the cards for war" do
        card1 = Card.new(:diamond, 'Queen', 12)
        card2 = Card.new(:diamond, 'Queen', 12)
        card3 = Card.new(:heart, 'Ace', 14)
        card4 = Card.new(:diamond, 'King', 13)
        card5 = Card.new(:spade, '7', 7)
        card6 = Card.new(:heart, 'Jack', 11)
        cards1 = [card1, card3, card5]
        cards2 = [card2, card4, card6]
        deck1 = Deck.new(cards1)
        deck2 = Deck.new(cards2)
        player1 = Player.new('Zach', deck1)
        player2 = Player.new('Notzach', deck2)
        turn = Turn.new(player1, player2)
        turn.pile_cards
        expect(turn.spoils_of_war).to eq [card1, card2, card3, card4, card5, card6]
        end
    end

    describe "award_spoils" do
        it 'Awards spoils to the winner' do
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
        turn.pile_cards
        turn.award_spoils(player2)
        binding.pry
        expect(player2.deck.cards.count).to eq 5
        end
    end

    

end

