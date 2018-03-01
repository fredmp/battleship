class ShipType

  attr_accessor :id, :name, :size, :quantity

  def self.all
    TYPES.keys.map do |type_key|
      self.create_by_key(type_key)
    end
  end

  private

  TYPES = {
    battleship: { id: 1, size: 4, quantity: 1 },
    cruiser:    { id: 2, size: 3, quantity: 2 },
    destroyer:  { id: 3, size: 2, quantity: 3 },
    submarine:  { id: 4, size: 1, quantity: 4 }
  }

  def initialize(params = {})
    self.id = params[:id]
    self.name = params[:name]
    self.size = params[:size]
    self.quantity = params[:quantity]
  end

  def self.create_by_key(key)
    hash = TYPES[key]
    ShipType.new(
      id: hash[:id],
      size: hash[:size],
      quantity: hash[:quantity],
      name: key.to_s.capitalize
    )
  end
end
