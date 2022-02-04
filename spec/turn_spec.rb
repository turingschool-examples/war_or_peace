require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do

    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    @deck1 = Deck.new([card1, card2, card5, card8])
    @deck2 = Deck.new([card3, card4, card6, card7])
    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)
    @turn = Turn.new(@player1,@player2)

  end

  it "#Turn exists" do
    expect(@turn).to be_an_instance_of(Turn)
  end

  it "#player1 exists" do
    expect(@turn.player1).to be_an_instance_of(Player)
  end

  it "#player2 exists" do
    expect(@turn.player2).to be_an_instance_of(Player)
  end

  it "#spoils_of_war starts empty" do
    expect(@turn.spoils_of_war).to eq([])
  end

  it "#type sets to :basic" do

    expect(@turn.type).to eq(:basic)

  end

  xit "#spoils_of_war is populated" do
    card1 = Card.new(:heart, 'Jack', 11)
    card3 = Card.new(:heart, '9', 9)
    deck1 = Deck.new([card1])
    deck2 = Deck.new([card3])
    player1 = Player.new("Megan",  deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(@player1,@player2)
    result = [player1.deck.cards[0].value,player2.deck.cards[0].value]
    turn.type
    turn.pile_cards
    p card1
    p turn.spoils_of_war
    expect(turn.spoils_of_war).to eq(result)
  end

  xit "#award_spoils" do

  end

end
