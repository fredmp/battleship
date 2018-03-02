class ShipPart
  attr_accessor :x, :y, :ship_id

  def initialize(params = {})
    self.x = params[:x]
    self.y = params[:y]
  end

  def self.from_json(json)
    ShipPart.new(x: json[:x], y: json[:y], ship_id: json[:ship_id])
  end
end
