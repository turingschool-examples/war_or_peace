require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/war_or_peace'

RSpec.describe Game do
    it 'exists' do
        game = Game.new(player1, player2)
        expect(game).to be_an_instance_of(Game)
    end

    it 'has readable attributes' do
        player = Player.new(player1, player2)

        expect(game.player1).to eq('Megan')
        expect(game.player2).to eq('Aurora')
    end


    
end 