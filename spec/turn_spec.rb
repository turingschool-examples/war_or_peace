require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
  describe '#initialize' do
    it "has player1 and player2" do
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
      expect(turn.player1).to be_a Player
      expect(turn.player2).to be_a Player
    end
  end

  describe '#type' do
    it "can be :basic, :war, or :mutually_assured_destruction" do
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
      expect(turn.type).to eq(:basic || :war || :mutually_assured_destruction)
    end
  end

  describe '#winner' do
    it "declares a winner" do
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
      expect(winner).to eq(player1)
    end
    it "declares a winner" do
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
      player1 = Player.new("Megan", deck2)
      player2 = Player.new("Aurora", deck1)
      turn = Turn.new(player1, player2)
      winner = turn.winner
      expect(winner).to eq(player2)
    end
    context "finds winner after bad_card is added"
      it "declares the player without bad_card a winner" do
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9)
        card4 = Card.new(:diamond, 'Jack', 11)
        deck1 = Deck.new([card1])
        deck2 = Deck.new([card4, card3, card2])
        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)
        turn = Turn.new(player1, player2)
        turn.start
        expect(player2)
        .to eq(turn.winner)
      end
    end
  end

  describe '#pile_cards' do
    it "sends cards to spoils_of_war" do
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
      expect(turn.spoils_of_war).to eq([card1, card3])
    end
  end

  describe '#award_spoils' do
    it ":basic moves the first cards in both decks to the winner" do
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
      turn.pile_cards
      turn.spoils_of_war
      turn.award_spoils(winner)
      expect(player1.deck.cards).to be_an Array
    end
    it ":war moves the first three cards in both decks to the winner" do
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
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      winner = turn.winner
      turn.pile_cards
      turn.spoils_of_war
      turn.award_spoils(winner)
      expect(player1.deck.cards).to be_an Array
    end
    it ":mutually_assured_destruction returns nothing with award_spoils" do
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
      winner = turn.winner
      expect(player1.deck.cards).to be_an Array
    end
  end

  describe '#start' do
    context 'war' do
      context 'playerA has less than three cards' do
        it 'PlayerA loses the game' do
          card1 = Card.new(:heart, 'Jack', 11)
          card2 = Card.new(:heart, '10', 10)
          card3 = Card.new(:heart, '9', 9)
          card4 = Card.new(:diamond, 'Jack', 11)
          deck1 = Deck.new([card1])
          deck2 = Deck.new([card4, card3, card2])
          player1 = Player.new("Megan", deck1)
          player2 = Player.new("Aurora", deck2)
          turn = Turn.new(player1, player2)
          turn.start
          expect(player1.has_lost?).to be true
        end
      end
    end
  end
  
  describe 'rank when no cards are in the deck' do
    context 'deck has 2 cards left' do
      it 'does not return nil when called' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      deck1 = Deck.new([card1])
      deck2 = Deck.new([card4, card3, card2])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.start
      expect(player1.deck.rank_of_card_at(2))
      .to_not be nil
    end
  end
end
