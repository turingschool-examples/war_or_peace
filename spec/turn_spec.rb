require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

# basic turn
describe Turn do
  before :each do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it "exists" do
    expect(@turn).to be_an_instance_of(Turn)
  end

  it "has readable attributes" do
    expect(@turn.player1.name).to eq('Megan')
    expect(@turn.player1.deck).to eq(@deck1)
    expect(@turn.player2.name).to eq('Aurora')
    expect(@turn.player2.deck).to eq(@deck2)
    expect(@turn.spoils_of_war).to eq([])
  end

  it "results in basic turn" do
    expect(@turn.type).to eq(:basic)
  end

  it "returns winner of basic turn" do
    winner = @turn.winner
    expect(@turn.winner).to eq(@player1)
  end

  it "piles cards for basic turn into spoils_of_war array" do
    @turn.pile_cards
    expect(@turn.spoils_of_war).to match_array([
      have_attributes(suit: :heart, value: "Jack", rank: 11),
      have_attributes(suit: :heart, value: "9", rank: 9),
    ])
  end

  it "awards spoils_of_war into correct players hand for basic turn" do
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)

    expect(@turn.player1.deck.cards).to match_array([
      have_attributes(suit: :heart, value: "10", rank: 10),
      have_attributes(suit: :heart, value: "8", rank: 8),
      have_attributes(suit: :diamond, value: "2", rank: 2),
      have_attributes(suit: :heart, value: "Jack", rank: 11),
      have_attributes(suit: :heart, value: "9", rank: 9),
    ])

    expect(@turn.player2.deck.cards).to match_array([
      have_attributes(suit: :diamond, value: "Jack", rank: 11),
      have_attributes(suit: :diamond, value: "Queen", rank: 12),
      have_attributes(suit: :heart, value: "3", rank: 3),
    ])
  end

end

# war turn
describe Turn do
  before :each do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it "results in war turn" do
    expect(@turn.type).to eq(:war)
  end

  it "returns winner of war turn" do
    winner = @turn.winner
    expect(@turn.winner).to eq(@player2)
  end

  it "piles cards for war turn into spoils_of_war array" do
    winner = @turn.winner
    @turn.pile_cards
    expect(@turn.spoils_of_war).to match_array([
      have_attributes(suit: :heart, value: "Jack", rank: 11),
      have_attributes(suit: :diamond, value: "Jack", rank: 11),
      have_attributes(suit: :heart, value: "10", rank: 10),
      have_attributes(suit: :heart, value: "9", rank: 9),
      have_attributes(suit: :heart, value: "8", rank: 8),
      have_attributes(suit: :diamond, value: "Queen", rank: 12),
    ])
  end

  it "awards spoils_of_war into correct players hand for war turn" do
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)

    expect(@turn.player1.deck.cards).to match_array([
      have_attributes(suit: :diamond, value: "2", rank: 2),
    ])

    expect(@turn.player2.deck.cards).to match_array([
      have_attributes(suit: :heart, value: "3", rank: 3),
      have_attributes(suit: :heart, value: "Jack", rank: 11),
      have_attributes(suit: :diamond, value: "Jack", rank: 11),
      have_attributes(suit: :heart, value: "10", rank: 10),
      have_attributes(suit: :heart, value: "9", rank: 9),
      have_attributes(suit: :heart, value: "8", rank: 8),
      have_attributes(suit: :diamond, value: "Queen", rank: 12),
    ])
  end

end

# mutually_assured_destruction turn
describe Turn do
  before :each do
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, '8', 8)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1, @player2)
  end

  it "results in mutually_assured_destruction turn" do
    expect(@turn.type).to eq(:mutually_assured_destruction)
  end

  it "returns winner of war turn" do
    winner = @turn.winner
    expect(@turn.winner).to eq("No Winner")
  end

  it "piles cards for mutually_assured_destruction turn into empty spoils_of_war array" do
    winner = @turn.winner
    @turn.pile_cards
    expect(@turn.spoils_of_war).to eq([])
  end

  it "awards spoils_of_war into correct players hand for m.a.d." do
    winner = @turn.winner
    @turn.pile_cards
    @turn.award_spoils(winner)

    expect(@turn.player1.deck.cards).to match_array([
      have_attributes(suit: :diamond, value: "2", rank: 2),
    ])

    expect(@turn.player2.deck.cards).to match_array([
      have_attributes(suit: :heart, value: "3", rank: 3),
    ])
  end

end
