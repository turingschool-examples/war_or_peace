require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  describe '#initialize' do
    it 'exists' do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3)
      card3 = Card.new(:heart, 'Ace', 14)
      card4 = Card.new(:diamond, 'Queen', 12)
      card5 = Card.new(:spade, '3', 3)
      card6 = Card.new(:heart, 'Ace', 14)
      card7 = Card.new(:spade, '3', 3)
      card8 = Card.new(:heart, 'Ace', 14)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new('Ryan', deck1)
      player2 = Player.new('Ash', deck2)
      turn = Turn.new(player1, player2)

      expect(turn.player1).to eq(player1)
      expect(turn.player2).to eq(player2)
      expect(turn.spoils_of_war).to eq([])
    end

    describe '#Turns' do
      it 'plays a basic turn' do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        card5 = Card.new(:heart, 'Queen', 12)
        card6 = Card.new(:diamond, '8', 8)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)
        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card3, card4, card6, card7])
        deck3 = Deck.new([card2, card5, card8, card1, card3])
        player1 = Player.new('Ryan', deck1)
        player2 = Player.new('Ash', deck2)
        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:basic)
        winner = turn.winner

        expect(winner).to eq(player1)

        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card3])

        turn.award_spoils(winner)
        expect(turn.player1.deck).to be_an_instance_of(Deck)
        expect(turn.player2.deck).to be_an_instance_of(Deck)
      end

      it 'plays a war turn' do
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
        player1 = Player.new('Ryan', deck1)
        player2 = Player.new('Ash', deck2)
        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:war)
        winner = turn.winner

        expect(winner).to eq(player2)

        turn.pile_cards
        expect(turn.spoils_of_war).to eq([card1, card4, card2, card3, card5, card6])

        turn.award_spoils(winner)
        expect(turn.player1.deck).to be_an_instance_of(Deck)
        expect(turn.player2.deck).to be_an_instance_of(Deck)
      end

      it 'plays a mutually_assured_destruction turn' do
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
        player1 = Player.new('Ryan', deck1)
        player2 = Player.new('Ash', deck2)
        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:mutually_assured_destruction)
        winner = turn.winner

        expect(winner).to eq('No Winner')

        turn.pile_cards
        expect(turn.spoils_of_war).to eq([])

        turn.award_spoils(winner)
        expect(turn.player1.deck).to be_an_instance_of(Deck)
        expect(turn.player2.deck).to be_an_instance_of(Deck)
      end
    end
  end
end
