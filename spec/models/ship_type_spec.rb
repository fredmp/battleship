require 'rails_helper'

RSpec.describe ShipType, type: :model do

  describe '.all' do
    it 'returns all ship types' do
      expected_types = {
        battleship: { size: 4, quantity: 1 },
        cruiser:    { size: 3, quantity: 2 },
        destroyer:  { size: 2, quantity: 3 },
        submarine:  { size: 1, quantity: 4 }
      }
      all_types = ShipType.all
      expect(all_types.size).to eq(4)
      all_types.each do |actual_type|
        expected_type = expected_types[actual_type.name.downcase.to_sym]
        expect(actual_type.size).to eq(expected_type[:size])
        expect(actual_type.quantity).to eq(expected_type[:quantity])
      end
    end
  end
end
