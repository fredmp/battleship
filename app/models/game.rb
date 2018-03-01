class Game

  attr_accessor :board_user_1, :board_user_2, :ships_user_1, :ships_user_2, :headers

  def initialize(params = {})
    @board_user_1 = params[:board_user_1]
    @board_user_2 = params[:board_user_2]
    @ships_user_1 = params[:ships_user_1] || []
    @ships_user_2 = params[:ships_user_2] || []
  end

  def self.start(x, y)
    game = Game.new
    game.headers = build_headers(x, y)
    game.board_user_1 = Board.build(x, y)
    game.board_user_2 = Board.build(x, y)

    build_fleet(game.board_user_1, game.ships_user_1)
    build_fleet(game.board_user_2, game.ships_user_2)
    game
  end

  def self.build_fleet(board, ships)
    Ship.build_fleet.each do |ship|
      board.add(ship)
      ships << ship
    end
  end

  def self.build_headers(x, y)
    {
      x: [*'A'..'Z',*'a'..'z'].first(x),
      y: (1..99).to_a.first(y),
    }
  end
end
