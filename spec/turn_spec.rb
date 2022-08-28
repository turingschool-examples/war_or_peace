require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @cards = [@card1, @card2, @card5, @card8, @card3, @card4, @card6, @card7]
    @deck1 = [@card1, @card2, @card5, @card8]
    @deck2 = [@card3, @card4, @card6, @card7]
    @player1 = Player.new("Megan", Deck.new(@deck1))
    @player2 = Player.new("Aurora", Deck.new(@deck2))
    @turn = Turn.new(@player1, @player2)
  end

  it "exists" do
    expect(@turn).to be_instance_of(Turn)
  end

  it "has attributes" do
    expect(@turn.player1).to eq(@player1)
    expect(@turn.player2).to eq(@player2)
    expect(@turn.spoils_of_war).to eq([])
  end

  describe "#type" do
    it "returns the winner of a basic turn" do
      expect(@turn.type).to eq(:basic)
      expect(@turn.winner).to eq(@player1)
      expect(@turn.winner).not_to eq(@player2)
    end

    it "returns the winner of a war" do
      deck1 = Deck.new([@card1, @card2, @card5, @card8])
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:war)
      expect(turn.winner).not_to eq(player1)
      expect(turn.winner).to eq(player2)
    end
    
    it "returns the winner of a mad" do
      @card1 = Card.new(:heart, 'Jack', 11)
      @card2 = Card.new(:heart, '10', 10)
      @card3 = Card.new(:heart, '9', 9)
      @card4 = Card.new(:diamond, 'Jack', 11)
      @card5 = Card.new(:heart, '8', 8)
      @card6 = Card.new(:diamond, '8', 8)
      @card7 = Card.new(:heart, '3', 3)
      @card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([@card1, @card2, @card5, @card8])
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      expect(turn.type).to eq(:mutually_assured_distruction)
      expect(turn.winner).not_to eq(player1)
      expect(turn.winner).not_to eq(player1)
    end
  end

  describe "#pile_cards into spoils_of_war" do
    it "can return piles of card for basic turn" do
    @turn.pile_cards
    expect(@turn.spoils_of_war).to eq([@card1, @card3])
    end

    it "can return piles of card for war turn" do
      deck1 = Deck.new([@card1, @card2, @card5, @card8])
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.pile_cards
      expect(turn.spoils_of_war).to eq([@card1, @card2, @card5, @card4, @card3, @card6])
    end

    it "can return piles of card for mad turn" do
      @card7 = Card.new(:heart, '3', 3)
      @card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([@card1, @card2, @card5, @card8])
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.winner
      turn.pile_cards
      expect(player1.deck.cards).to eq([@card8])
      expect(player2.deck.cards).to eq([@card7])
    end

  end
  describe "#award_spoils" do
    it "award the spoils to a basic turn" do
      winner = @turn.winner
      @turn.pile_cards
      @turn.award_spoils(winner)
      expect(@player1.deck.cards.count).to eq(5)
      expect(@player2.deck.cards.count).to eq(3)
    end

    it "award the spoils to a war turn" do
      deck1 = Deck.new([@card1, @card2, @card5, @card8])
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      winner = turn.winner
      turn.pile_cards
      turn.award_spoils(winner)
      expect(player1.deck.cards.count).to eq(1)
      expect(player2.deck.cards.count).to eq(7)
    end

    it "award the spoils to a mad turn" do
      @card7 = Card.new(:heart, '3', 3)
      @card8 = Card.new(:diamond, '2', 2)
      deck1 = Deck.new([@card1, @card2, @card5, @card8])
      deck2 = Deck.new([@card4, @card3, @card6, @card7])
      player1 = Player.new("Megan", deck1)
      player2 = Player.new("Aurora", deck2)
      turn = Turn.new(player1, player2)
      turn.pile_cards
      expect(player1.deck.cards.count).to eq(1)
      expect(player2.deck.cards.count).to eq(1)
    end
  end
end
