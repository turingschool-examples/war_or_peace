require './lib/turn'
require './lib/card'
require './lib/player'
require './lib/deck'

describe Turn do
  
  it 'is an instance of turn' do
    turn = Turn.new("player1", "deck")
    expect(turn).to be_a(Turn)
  end

describe " turn type :basic" do
  
  it 'is a basic turn' do
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
    expect(turn.player1).to be_a(Player)
    expect(turn.player2).to be_a(Player)
    turn.pile_cards
    expect(turn.spoils_of_war).to be_an(Array)
    expect(turn.spoils_of_war.size).to eq(2)
    expect(turn.type).to eq(:basic)
  end

  it 'has a winner and awards cards' do
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

    expect(turn.winner).to eq(player1)
    winner = turn.winner
    turn.pile_cards
    expect(turn.spoils_of_war).to be_an(Array)
    expect(turn.spoils_of_war.size).to eq(2)
  
    turn.award_spoils(winner)
    expect(player1.deck).to be_a(Deck)
    expect(player1.deck.cards.size).to eq(5)
    expect(player2.deck).to be_a(Deck)
    expect(player2.deck.cards.size).to eq(3)
  end
end
  
describe "turn type :war" do

  it 'has a war type turn' do
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

    expect(turn.type).to eq(:war)
  end

  it 'has a winner and can award cards' do
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

    expect(winner).to eq(player2)
    turn.pile_cards
    expect(turn.spoils_of_war).to be_an(Array)
    expect(turn.spoils_of_war.size).to eq(6)
    
    turn.award_spoils(winner)

    expect(player1.deck).to be_a(Deck)
    expect(player2.deck).to be_a(Deck)
    expect(player1.deck.cards.size).to eq(1)
    expect(player2.deck.cards.size).to eq(7)

  end

describe 'mutually_assured_destruction' do
    it 'works and produces "No winner"' do
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
    expect(turn.type).to eq(:mutually_assured_destruction)
    winner = turn.winner
    expect(winner).to eq("No Winner")
    turn.pile_cards
    expect(turn.spoils_of_war).to eq([])
    expect(player1.deck.cards.size).to eq(1)
    expect(player2.deck.cards.size).to eq(1)
    end
  end
end
end