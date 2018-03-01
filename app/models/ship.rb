class Ship

  attr_accessor :id, :name, :parts

  def initialize(params = {})
    self.id = params[:id]
    self.name = params[:name]
    self.parts = params[:parts]
  end

  def navigate_to(board, positions)
    index = 0
    positions.each do |position_id|
      set_part(parts[index], board.element_by_id(position_id))
      index += 1
    end
  end

  def set_part(part, board_element)
    board_element.ship_part = part
    part.x = board_element.x
    part.y = board_element.y
    part.ship_id = self.id
  end

  def size
    parts.size
  end

  def self.build_fleet
    ShipType.all.map do |type|
      type.quantity.times.map do |unit|
        self.build_by_type(type, unit)
      end
    end.flatten
  end

  def self.build_by_type(type, unit)
    Ship.new(id: "#{type.id}#{unit}".to_i(10), name: type.name, parts: type.size.times.map { ShipPart.new })
  end
end
