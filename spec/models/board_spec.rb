require 'rails_helper'

RSpec.describe Board, type: :model do

  subject(:board) { Board.build(10, 10) }

  describe '.build' do
    it 'builds a new board' do
      expect(board.x).to eq(10)
      expect(board.y).to eq(10)
      expect(board.elements.size).to eq(10)
      expect(board.elements.first.size).to eq(10)
      board.elements.each do |line|
        line.each do |element|
          expect(element.status).to eq(0)
        end
      end
    end
  end

  describe '#add' do
    it 'adds a ship to the board' do
      ship = Ship.build_by_type(ShipType.all.first, 0)

      ship.parts.each do |part|
        expect(part.x).to be_nil
        expect(part.y).to be_nil
      end

      board.add(ship)

      ship.parts.each do |part|
        board_element = board.elements[part.x][part.y]
        expect(part.x).not_to be_nil
        expect(part.y).not_to be_nil
        expect(board_element.ship_part).to eq(part)
      end
    end
  end
end
