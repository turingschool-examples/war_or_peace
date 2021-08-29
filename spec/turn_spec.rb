require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './spec/deck_spec'
require './spec/card_spec'
require './spec/player_spec'
require 'pry'

RSpec.describe Turn do
  describe '#initialize' do
    it 'describes player setup' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      card9 = Card.new(:spade, '11', 11)
      card10 = Card.new(:club, 'Ace', 14)
      card11 = Card.new(:heart, 'King', 13)
      card12 = Card.new(:diamond, '6',6)
      card13 = Card.new(:club, '9', 9)
      card14 = Card.new(:spade, 'Jack', 11)
      card15 = Card.new(:heart, 'Queen', 12)
      card16 = Card.new(:club, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      cards_3 = [card9, card10, card11, card12]
      cards_4 = [card13, card14, card15, card16]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      deck3 = Deck.new(cards_3)
      deck4 = Deck.new(cards_4)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      player3 = Player.new("Rick", deck3)
      player4 = Player.new("Kim", deck4)
      expect(deck1.cards).to eq(cards_1)
      expect(deck2.cards).to eq(cards_2)
      expect(deck3.cards).to eq(cards_3)
      expect(deck4.cards).to eq(cards_4)
      expect(player1).to be_a(Player)
      expect(player2).to be_a(Player)
      expect(player3).to be_a(Player)
      expect(player4).to be_a(Player)
      expect(player1.name).to eq("Megan")
      expect(player2.name).to eq("Aurora")
      expect(player3.name).to eq("Rick")
      expect(player4.name).to eq ("Kim")
      expect(player1.deck).to eq(deck1)
      expect(player2.deck).to eq(deck2)
      expect(player3.deck).to eq(deck3)
      expect(player4.deck).to eq(deck4)
    end
  end

  describe "#turn_type" do
    it 'denotes type of turn' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      card9 = Card.new(:spade, '11', 11)
      card10 = Card.new(:club, 'Ace', 14)
      card11 = Card.new(:heart, 'King', 13)
      card12 = Card.new(:diamond, '6',6)
      card13 = Card.new(:club, '9', 9)
      card14 = Card.new(:spade, 'Jack', 11)
      card15 = Card.new(:heart, 'Queen', 12)
      card16 = Card.new(:club, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      cards_3 = [card9, card10, card11, card12]
      cards_4 = [card13, card14, card15, card16]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      deck3 = Deck.new(cards_3)
      deck4 = Deck.new(cards_4)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      player3 = Player.new("Rick", deck3)
      player4 = Player.new("Kim", deck4)
      turn = Turn.new(player1, player2)
      turn_2 = Turn.new(player1, player3)
      turn_3 = Turn.new(player2, player4)
      expect(turn).to be_a(Turn)
      expect(turn.type).to eq(:basic)
      expect(turn_2.type).to eq(:war)
      expect(turn_3.type).to eq(:mutually_assured_destruction)
    end
  end

  describe '#player1' do
    it 'identifies player 1' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      card9 = Card.new(:spade, '11', 11)
      card10 = Card.new(:club, 'Ace', 14)
      card11 = Card.new(:heart, 'King', 13)
      card12 = Card.new(:diamond, '6',6)
      card13 = Card.new(:club, '9', 9)
      card14 = Card.new(:spade, 'Jack', 11)
      card15 = Card.new(:heart, 'Queen', 12)
      card16 = Card.new(:club, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      cards_3 = [card9, card10, card11, card12]
      cards_4 = [card13, card14, card15, card16]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      deck3 = Deck.new(cards_3)
      deck4 = Deck.new(cards_4)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      player3 = Player.new("Rick", deck3)
      player4 = Player.new("Kim", deck4)
      turn = Turn.new(player1, player2)
      turn_2 = Turn.new(player1, player3)
      turn_3 = Turn.new(player2, player4)
      expect(turn.player1).to eq(player1)
      expect(turn_2.player1).to eq(player1)
      expect(turn_3.player1).to eq(player2)
    end
  end

  describe '#player2' do
    it 'identifies player 2' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      card9 = Card.new(:spade, '11', 11)
      card10 = Card.new(:club, 'Ace', 14)
      card11 = Card.new(:heart, 'King', 13)
      card12 = Card.new(:diamond, '6',6)
      card13 = Card.new(:club, '9', 9)
      card14 = Card.new(:spade, 'Jack', 11)
      card15 = Card.new(:heart, 'Queen', 12)
      card16 = Card.new(:club, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      cards_3 = [card9, card10, card11, card12]
      cards_4 = [card13, card14, card15, card16]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      deck3 = Deck.new(cards_3)
      deck4 = Deck.new(cards_4)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      player3 = Player.new("Rick", deck3)
      player4 = Player.new("Kim", deck4)
      turn = Turn.new(player1, player2)
      turn_2 = Turn.new(player1, player3)
      turn_3 = Turn.new(player2, player4)
      expect(turn.player2).to eq(player2)
      expect(turn_2.player2).to eq(player3)
      expect(turn_3.player2).to eq(player4)
    end
  end

  describe '#spoils_of_war' do
    it 'identifes spoils of war' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      card9 = Card.new(:spade, '11', 11)
      card10 = Card.new(:club, 'Ace', 14)
      card11 = Card.new(:heart, 'King', 13)
      card12 = Card.new(:diamond, '6',6)
      card13 = Card.new(:club, '9', 9)
      card14 = Card.new(:spade, 'Jack', 11)
      card15 = Card.new(:heart, 'Queen', 12)
      card16 = Card.new(:club, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      cards_3 = [card9, card10, card11, card12]
      cards_4 = [card13, card14, card15, card16]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      deck3 = Deck.new(cards_3)
      deck4 = Deck.new(cards_4)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      player3 = Player.new("Rick", deck3)
      player4 = Player.new("Kim", deck4)
      turn = Turn.new(player1, player2)
      turn_2 = Turn.new(player1, player3)
      turn_3 = Turn.new(player2, player4)
      expect(turn.spoils_of_war).to eq([])
      expect(turn_2.spoils_of_war).to eq([])
        expect(turn_3.spoils_of_war).to eq([])
    end
  end

  describe "#winner" do
    it 'identifies winner' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      card9 = Card.new(:spade, '11', 11)
      card10 = Card.new(:club, 'Ace', 14)
      card11 = Card.new(:heart, 'King', 13)
      card12 = Card.new(:diamond, '6',6)
      card13 = Card.new(:club, '9', 9)
      card14 = Card.new(:spade, 'Jack', 11)
      card15 = Card.new(:heart, 'Queen', 12)
      card16 = Card.new(:club, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      cards_3 = [card9, card10, card11, card12]
      cards_4 = [card13, card14, card15, card16]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      deck3 = Deck.new(cards_3)
      deck4 = Deck.new(cards_4)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      player3 = Player.new("Rick", deck3)
      player4 = Player.new("Kim", deck4)
      turn = Turn.new(player1, player2)
      turn_2 = Turn.new(player1, player3)
      turn_3 = Turn.new(player2, player4)
      expect(turn.winner).to eq(player1)
      expect(turn_2.winner).to eq(player3)
      expect(turn_3.winner).to eq("No Winner")
    end
  end

  describe '#pile_cards' do
    it 'moves cards to spoils' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      card9 = Card.new(:spade, '11', 11)
      card10 = Card.new(:club, 'Ace', 14)
      card11 = Card.new(:heart, 'King', 13)
      card12 = Card.new(:diamond, '6',6)
      card13 = Card.new(:club, '9', 9)
      card14 = Card.new(:spade, 'Jack', 11)
      card15 = Card.new(:heart, 'Queen', 12)
      card16 = Card.new(:club, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      cards_3 = [card9, card10, card11, card12]
      cards_4 = [card13, card14, card15, card16]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      deck3 = Deck.new(cards_3)
      deck4 = Deck.new(cards_4)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      player3 = Player.new("Rick", deck3)
      player4 = Player.new("Kim", deck4)
      turn = Turn.new(player1, player2)
      turn_2 = Turn.new(player1, player3)
      turn_3 = Turn.new(player2, player4)
      expect(turn.pile_cards).to eq([card1, card3])
      expect(turn_2.pile_cards).to eq([[card1, card2, card5], [card9, card10, card11]])
      expect(turn_3.pile_cards).to eq([])
    end
  end

  describe '#award_spoils' do
    it 'awards spoils' do
      card1 = Card.new(:heart, 'Jack', 11)
      card2 = Card.new(:heart, '10', 10)
      card3 = Card.new(:heart, '9', 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, 'Queen', 12)
      card7 = Card.new(:heart, '3', 3)
      card8 = Card.new(:diamond, '2', 2)
      card9 = Card.new(:spade, '11', 11)
      card10 = Card.new(:club, 'Ace', 14)
      card11 = Card.new(:heart, 'King', 13)
      card12 = Card.new(:diamond, '6',6)
      card13 = Card.new(:club, '9', 9)
      card14 = Card.new(:spade, 'Jack', 11)
      card15 = Card.new(:heart, 'Queen', 12)
      card16 = Card.new(:club, '2', 2)
      cards_1 = [card1, card2, card5, card8]
      cards_2 = [card3, card4, card6, card7]
      cards_3 = [card9, card10, card11, card12]
      cards_4 = [card13, card14, card15, card16]
      deck1 = Deck.new(cards_1)
      deck2 = Deck.new(cards_2)
      deck3 = Deck.new(cards_3)
      deck4 = Deck.new(cards_4)
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      player3 = Player.new("Rick", deck3)
      player4 = Player.new("Kim", deck4)
      turn = Turn.new(player1, player2)
      turn_2 = Turn.new(player1, player3)
      turn_3 = Turn.new(player2, player4)
      expect(turn.award_spoils(player1)).to eq(cards_1)
      expect(turn_2.award_spoils(player2)).to eq(nil)
      expect(turn_3.award_spoils([])).to eq("Next Round!")
    end
  end
end
