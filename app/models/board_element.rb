class BoardElement

  attr_accessor :x, :y, :ship_part

  def initialize(params = {})
    self.x = params[:x]
    self.y = params[:y]
    self.ship_part = params[:ship_part]
  end

  def status
    0
  end

  def id
    "#{x}-#{y}"
  end

  def available?
    self.ship_part == nil
  end

  def to_s
    ship_part ? ship_part.ship_id.to_s : '.'
  end

  def self.from_json(json)
    part = ShipPart.from_json(json[:ship_part]) if json[:ship_part]
    BoardElement.new(x: json[:x], y: json[:y], ship_part: part)
  end
end
