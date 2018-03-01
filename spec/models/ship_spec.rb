require 'rails_helper'

RSpec.describe Ship, type: :model do

  describe '.build_fleet' do
    it 'builds a new fleet of ships' do
      expect(Ship.build_fleet.size).to eq(10)
    end

    it 'when a ship is built it has many parts' do
      Ship.build_fleet.each do |ship|
        expect(ship.parts.size).to be > 0
      end
    end
  end
end
