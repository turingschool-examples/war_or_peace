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
        it 'tells card type' do
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

    describe '#pile_cards' do
        it "Piles the cards" do
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
        expect(turn.pile_cards).to eq player1.deck.count(2) && player2.deck.count(2)
        end
    end

end

