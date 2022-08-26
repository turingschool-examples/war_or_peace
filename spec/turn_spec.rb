require 'spec_helper'

RSpec.describe 'iteration 2' do
  let(:card1) { Card.new(:heart, 'Jack', 11) }
  let(:card2) { Card.new(:heart, '10', 10) }
  let(:card3) { Card.new(:heart, '9', 9) }
  let(:card4) { Card.new(:diamond, 'Jack', 11) }
  let(:card5) { Card.new(:heart, '8', 8) }
  let(:card6) { Card.new(:diamond, 'Queen', 12) }
  let(:card7) { Card.new(:heart, '3', 3) }
  let(:card8) { Card.new(:diamond, '2', 2) }
  let(:deck1) { Deck.new([card1, card2, card5, card8]) }
  let(:deck2) { Deck.new([card3, card4, card6, card7]) }
  # war situation
  let(:deck3) { Deck.new([card1, card2]) }
  let(:deck4) { Deck.new([card4, card3, card6, card7]) }
  let(:deck5) { Deck.new([card4]) }
  let(:deck6) { Deck.new([card1, card2, card6, card1]) }
  let(:player1) { Player.new('Megan', deck1) }
  let(:player2) { Player.new('Aurora', deck2) }
  let(:player3) { Player.new('April', deck3) }
  let(:player4) { Player.new('Maddie', deck4) }
  let(:player5) { Player.new('Aurora', deck6) }
  let(:turn) { Turn.new(player3, player4) }

  context 'Turn :basic' do
    context '#init' do
      it 'exists' do
        expect(turn).to be_a(Turn)
      end
    end

    context '#type' do
      it 'is :basic when card at 0 is not the same' do
        turn = Turn.new(player1, player2)
        expect(turn.type).to eq(:basic)
      end
    end

    context '#winner' do
      it 'determines the winner' do
        turn = Turn.new(player1, player2)
        expect(turn.type).to eq(:basic)
        expect(turn.winner.name).to eq('Megan')
        turn.pile_cards
        # require 'pry'; binding.pry
      end
    end

    context '#pile_cards' do
      it 'returns the winner of the hand' do
        turn = Turn.new(player1, player2)
        hand_winner = turn.winner
        expect(turn.type).to eq(:basic)
        expect(turn.winner).to eq(player1)
      end
    end

    context '#award_spoils' do
      it 'awards contents of @spoils_of_war to winner' do
        turn = Turn.new(player1, player2)
        expect(turn.winner).to eq(player1)
        turn.pile_cards
        expect(turn.spoils_of_war.length).to eq(2)
        turn.award_spoils(player1)
        expect(player1.deck.cards.length).to eq(5)
      end
    end
  end

  context 'Turn :war' do
    context '#type' do
      it 'is :war when cards at 0 are the same' do
        player1 = Player.new('Megan', deck1)
        player2 = Player.new('Aurora', deck4)
        turn = Turn.new(player1, player2)
        expect(turn.type).to eq(:war)
      end
    end

    context '#winner' do
      it 'determines the winner' do
        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card4, card3, card6, card7])
        player1 = Player.new('Megan', deck1)
        player2 = Player.new('Aurora', deck2)
        turn = Turn.new(player1, player2)
        # require 'pry'; binding.pry
        expect(turn.winner).to eq(player2)
        expect(turn.type).to eq(:war)
      end
    end

    context '#pile_cards' do
      it 'puts 6 card in @spoils_of_war' do
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
        player1 = Player.new('Megan', deck1)
        player2 = Player.new('Aurora', deck2)
        turn = Turn.new(player1, player2)
        turn.pile_cards
        expect(turn.spoils_of_war.length).to eq(6)
      end

      it 'does not change the turn.type' do
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
        player1 = Player.new('Megan', deck1)
        player2 = Player.new('Aurora', deck2)
        turn = Turn.new(player1, player2)
        expect(turn.type).to eq(:war)
        turn.pile_cards
        expect(turn.type).not_to eq(:war)
      end
    end

    context '#award_spoils' do
      it 'awards contents of spoils_of_war to winner' do
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
        player1 = Player.new('Megan', deck1)
        player2 = Player.new('Aurora', deck2)
        turn = Turn.new(player1, player2)
        turn.pile_cards
        turn.award_spoils(player2)
        expect(player1.deck.cards.length).to eq(1)
        expect(player2.deck.cards.length).to eq(7)
      end
    end
  end

  context 'Turn :mutually_assured_destruction' do
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
    player1 = Player.new('Megan', deck1)
    player2 = Player.new('Aurora', deck2)
    turn = Turn.new(player1, player2)

    context '#type' do
      it 'is :mutually_assured_destruction when cards at 0 and 2 are the same' do
        expect(turn.type).to eq(:mutually_assured_destruction)
      end
    end

    context '#winner' do
      it "returns string 'No Winner'" do
        expect(turn.winner).to eq('No Winner')
        expect(turn.type).to eq(:mutually_assured_destruction)
      end
    end

    context '#pile_cards' do
      it 'removes the first three cards from each player' do
        turn.pile_cards
        expect(player1.deck.cards.count).to eq(1)
        expect(player2.deck.cards.length).to eq(1)
      end
    end

    context '#spoils_of_war' do
      it 'remains empty' do
        expect(turn.spoils_of_war).to eq([])
      end
    end
  end
  
  describe '#init' do
    it 'can start with a player with no cards' do
      turn.player1.deck.cards = []
      expect(turn.player1.deck.cards.length).to eq(0) 
    end
  end
end
