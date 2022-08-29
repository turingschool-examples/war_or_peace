
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/gamecards'

RSpec.describe GameCards do
  let(:gamecards) {GameCards.new()}

  it 'should exist as a class with attributes inherited from Card class' do
    expect(gamecards).to be_a GameCards
    expect(gamecards.suit).to eq ([:diamond, :spade,:heart, :club])
    # expect(gamecards.rank).to include 5
    # require 'pry';binding.pry
  end


end