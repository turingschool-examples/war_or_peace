require 'spec_helper'

RSpec.describe 'iteration 4' do
  context Engine do
    before(:all) do
      @game = Engine.new
    end
    
    context '#init' do
      it 'exists' do
        expect(@game).to be_an(Engine)
      end
    end
    
    context '#start' do
      it 'creates text to the screen' do
        expect{ @game.start }.to output.to_stdout
      end
    end
  end
end