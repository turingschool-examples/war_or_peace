require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


RSpec.describe Game do
    it 'exists' do
        game = Game.new
        expect(game).to be_an_instance_of(Game)
    end

    xit 'has a deck' do
        expect(game.new_deck).to eq([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16, card17, card18, card19, card20, card21, card22, card23, card24, card25, card26, card27, card28, card29, card30, card31, card32, card33, card34, card35, card36, card37, card38, card39, card40, card41, card42, card43, card44, card45, card46, card47, card48, card49, card50, card51, card52]) 
    end


    
end 