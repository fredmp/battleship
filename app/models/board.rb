class Board

  attr_accessor :x, :y, :elements

  def initialize(params = {})
    self.x = params[:x]
    self.y = params[:y]
  end

  def add(ship, invalid_positions = [])
    raise 'Failed to add ship to board: maximun attemps reached' if invalid_positions.size > x * y
    target_x = rand(x)
    target_y = rand(y)
    position_id = "#{target_x}-#{target_y}"

    return add(ship, invalid_positions) if invalid_positions.include?(position_id)

    positions = sequential_position_ids(target_x, target_y, ship)

    unless segment_available?(positions)
      invalid_positions << position_id
      return add(ship, invalid_positions)
    end

    ship.navigate_to(self, positions)
  end

  def self.build(x, y)
    board = Board.new(x: x, y: y)
    board.elements = x.times.map do |position_x|
      y.times.map do |position_y|
        BoardElement.new(x: position_x, y: position_y)
      end
    end
    board
  end

  def element_by_id(id)
    elements.each do |entry|
      entry.each do |element|
        return element if element.id == id
      end
    end
    nil
  end

  def to_s
    output = ''
    elements.each do |entry|
      entry.each do |element|
        output += "\t#{element.to_s}"
      end
      output += "\n"
    end
    output
  end

  private

  def sequential_position_ids(target_x, target_y, ship)
    orientation = random_orientation
    target = horizontal?(orientation) ? target_x : target_y
    (target..(target + ship.size - 1)).map do |el|
      horizontal?(orientation) ? "#{el}-#{target_y}" : "#{target_x}-#{el}"
    end
  end

  def segment_available?(position_ids)
    position_ids.each do |id|
      element = element_by_id(id)
      return false if element.nil? || !element.available?
    end
    return true
  end

  def positioning_modifier(orientation)
    orientation == :horizontal ? 0 : 10
  end

  def horizontal?(orientation)
    orientation == :horizontal
  end

  def random_orientation
    rand(2) > 0 ? :horizontal : :vertical
  end
end
