require 'rails_helper'

RSpec.describe Game, type: :model do

  describe '.start' do
    it 'starts a new game' do
      game = Game.start(10, 10)

      expect(game.board_user_1.elements.size).to eq(10)
      expect(game.board_user_1.elements.first.size).to eq(10)
      expect(game.ships_user_1.size).to eq(10)

      expect(game.board_user_2.elements.size).to eq(10)
      expect(game.board_user_2.elements.first.size).to eq(10)
      expect(game.ships_user_2.size).to eq(10)

      expect(game.headers[:x].size).to eq(10)
      expect(game.headers[:y].size).to eq(10)
    end
  end

  describe '#load' do
    it 'loads a game from json' do
      file = File.read(Rails.root.join('spec/support/game.json'))
      json = JSON.parse(file, symbolize_names: true)
      game = Game.from_json(json)

      expect(game.board_user_1.elements.size).to eq(10)
      expect(game.board_user_1.elements.first.size).to eq(10)
      expect(game.ships_user_1.size).to eq(10)

      expect(game.board_user_2.elements.size).to eq(10)
      expect(game.board_user_2.elements.first.size).to eq(10)
      expect(game.ships_user_2.size).to eq(10)

      expect(game.headers[:x].size).to eq(10)
      expect(game.headers[:y].size).to eq(10)
    end
  end
end
