require './lib/turn'

describe Turn do
  
  it 'is an instance of turn' do
  turn = Turn.new("player1", "player2")
    expect(turn).to be_a(Turn)
  end

  xit 'can track the current turn' do

    turn.GO 
    
    expect(turn.count).to eq(3)

  end

  xit 'Can have a player win a hand' do


    expect(string).to include("won", "cards")

  end

  xit 'can handle a tie with war' do


    

  end

  xit 'can handle M.A.D.' do



  end

end

