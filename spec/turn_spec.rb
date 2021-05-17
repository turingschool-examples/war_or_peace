require './lib/turn'
require './lib/deck'
require './lib/card'
require './lib/player'

RSpec.describe Turn do
  before :each do
    @card1 = Card.new(:spade, 'Four', 4)
    @card2 = Card.new(:spade, 'Five', 5)
    @card3 = Card.new(:spade, 'Six', 6)
    @card4 = Card.new(:heart, 'Nine', 9)
    @card5 = Card.new(:heart, 'Ten', 10)
    @card6 = Card.new(:heart, 'Jack', 11)
    @card7 = Card.new(:diamond, 'Jack', 11)
    @card8 = Card.new(:diamond, 'Queen', 12)
    @card9 = Card.new(:diamond, 'King', 13)
    @card10 = Card.new(:diamond, 'Ace', 14)

    @deck1 = Deck.new([@card1, @card3, @card5, @card7, @card9])
    @deck2 = Deck.new([@card2, @card4, @card6, @card8, @card10])

    @player1 = Player.new('Aedion', @deck1)
    @player2 = Player.new('Aelin', @deck2)

    @turn = Turn.new(@player1, @player2)


  end

  it 'exists and has attributes' do
    expect(@turn.player1.name).to eq('Aedion')
    expect(@turn.player2.name).to eq('Aelin')
    expect(@turn).to be_a(Turn)
  end

  it 'determines winner' do
    expect(@turn.winner).to eq(@player2)
  end

  it 'sends cards into spoils of war' do
    @turn.spoils_of_war
    # expect(@turn.type).to eq(:basic)
    expect(pile_cards).to eq([@card1, @card2])
    # expect(@spoils_of_war).to eq(@card2)
  end

end
