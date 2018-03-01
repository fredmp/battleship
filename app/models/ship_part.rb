class ShipPart
  attr_accessor :x, :y, :ship_id

  def initialize(params = {})
    self.x = params[:x]
    self.y = params[:y]
  end
end
