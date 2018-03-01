require 'rails_helper'

RSpec.describe Game, type: :model do

  describe '.start' do
    it 'starts a new game' do
      game = Game.start(10, 10)
      board_1 = game.board_user_1
      ships_1 = game.ships_user_1
      board_2 = game.board_user_2
      ships_2 = game.ships_user_2
      
      expect(board_1.elements.size).to eq(10)
      expect(board_1.elements.first.size).to eq(10)
      expect(ships_1.size).to eq(10)

      expect(board_2.elements.size).to eq(10)
      expect(board_2.elements.first.size).to eq(10)
      expect(ships_2.size).to eq(10)
    end
  end
end
