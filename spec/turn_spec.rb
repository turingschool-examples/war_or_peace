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
    lcard1 = Card.new(:heart, 'Jack', 11)
    lcard3 = Card.new(:heart, '9', 9)
    ldeck1 = Deck.new([lcard1])
    ldeck2 = Deck.new([lcard3])
    lplayer1 = Player.new("Megan",  ldeck1)
    lplayer2 = Player.new("Aurora", ldeck2)
    lturn = Turn.new(lplayer1, lplayer2)
    result = [lturn.player1.deck.cards, lturn.player2.deck.cards]
    lturn.type
    lturn.pile_cards
    #p card1
    #p turn.spoils_of_war
    expect(lturn.spoils_of_war).to eq(result)
  end

  it "#award_spoils adds cards to winner" do

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
    player1 = Player.new("Megan",  deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1,player2)
    turn.type
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    #player 1 deck should be 5
    #player 2 deck should be 3
    expect(turn.player1.deck.cards.length).to eq(5)
    expect(turn.player2.deck.cards.length).to eq(3)

  end
  it "#type set to :war" do

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
    player1 = Player.new("Megan",  deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1,player2)
    turn.type

    expect(turn.type).to eq(:war)

  end
  it "#type :mutually_assured_destruction " do
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
    player1 = Player.new("Megan",  deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1,player2)
    turn.type

    expect(turn.type).to eq(:mutually_assured_destruction)
  end

  it "#winner for mutually_assured_destruction " do
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
    player1 = Player.new("Megan",  deck1)
    player2 = Player.new("Aurora", deck2)
    turn = Turn.new(player1,player2)
    turn.type

    expect(turn.winner).to eq("No Winner")
  end

  xit "#pile_cards works for mutually_assured_destruction" do
  end

  xit "#spoils_of_war works for mutually_assured_destruction" do
  end

end
