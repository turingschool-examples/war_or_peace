require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

describe Turn do
  it 'exists' do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn).to be_an_instance_of(Turn)
  end

  it "can read attributes" do
    card1 = Card.new(:heart, "Jack", 11)
    card2 = Card.new(:heart, "10", 10)
    card3 = Card.new(:heart, "9", 9)
    card4 = Card.new(:diamond, "Jack", 11)
    card5 = Card.new(:heart, "8", 8)
    card6 = Card.new(:diamond, "Queen", 12)
    card7 = Card.new(:heart, "3", 3)
    card8 = Card.new(:diamond, "2", 2)
    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card4, card3, card6, card7])
    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1, player2)

    expect(turn.player1).to eq(player1)
    expect(turn.player2).to eq(player2)
    expect(turn.spoils_of_war).to eq([])

  end

  describe '#type' do
    it "is a basic turn" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:basic)
    end

    it "is a war turn" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, 'Jack', 11)
      card5 = Card.new(:heart, '8', 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:war)
    end

    it "is a mutually assured destruction turn" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "8", 8)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      expect(turn.type).to eq(:mutually_assured_destruction)
    end
  end

  describe "#winner" do
    it "returns the player with a higher ranked first card when type is :basic" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      expect(turn.winner).to eq(player1)

    end

    it "returns the player with a higher ranked third card when type is :war" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      expect(turn.winner).to eq(player2)
    end

    it "returns no winner when type is :mutually_assured_destruction" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "8", 8)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      expect(turn.winner).to eq("No Winner")
    end
  end

  describe "#pile_cards" do
    it "adds one card from each player to the pile when the turn is :basic" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      turn.pile_cards

      expect(turn.spoils_of_war).to eq([card1, card3])
    end

    it "adds three cards from each player to the pile when turn is :war" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      turn.pile_cards

      expect(turn.spoils_of_war).to eq([card1, card2, card5, card4, card3, card6])
    end

    it "removes three cards from each players deck when turn is :mutually_assured_destruction" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "8", 8)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      turn.pile_cards

      expect(turn.spoils_of_war).to eq([])
      expect(player1.deck.cards.length).to eq(1)
      expect(player2.deck.cards.length).to eq(1)
    end
  end

  describe "#award_spoils" do
    it "awards the two cards in spoils_of_war to the winner" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card3, card4, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)

      expect(player1.deck.cards).to eq([card2, card5, card8, card1, card3])
      expect(player2.deck.cards).to eq([card4, card6, card7])
    end

    it "awards the 6 cards in spoils to the winner" do
      card1 = Card.new(:heart, "Jack", 11)
      card2 = Card.new(:heart, "10", 10)
      card3 = Card.new(:heart, "9", 9)
      card4 = Card.new(:diamond, "Jack", 11)
      card5 = Card.new(:heart, "8", 8)
      card6 = Card.new(:diamond, "Queen", 12)
      card7 = Card.new(:heart, "3", 3)
      card8 = Card.new(:diamond, "2", 2)
      deck1 = Deck.new([card1, card2, card5, card8])
      deck2 = Deck.new([card4, card3, card6, card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)

      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)

      expect(player1.deck.cards).to eq([card8])
      expect(player2.deck.cards).to eq([card7, card1, card2, card5, card4, card3, card6])
    end
  end

end
