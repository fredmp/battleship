class GameChannel < ApplicationCable::Channel
  # Called when the consumer has successfully
  # become a subscriber of this channel.
  def subscribed
    if game = find_existing_game
      add_user_to(game)
      stream_from game_channel_id
    else
      game = create_game
      stream_from game_channel_id
    end
    ActionCable.server.broadcast game_channel_id, game: game
  end

  def receive(data)
    # action = data['action']
    # TODO: set the move - define next player - broadcast game
    # game.move(user_id, action)
    #   - validate whether this user can perform the action
    #   - change game state
    ActionCable.server.broadcast game_channel_id, game: 'Game....'
  end

  private

  def game_channel_id
    "game_channel_#{game_id}"
  end

  def add_user_to(game)
    game.user2 = user_id
    game_id = game.id
    $redis.set(game_id, game.to_json)
    $redis.expire(game_id, 60)
  end

  def find_existing_game
    redis_entry = $redis.lpop('waiting_list')
    if redis_entry
      json = JSON.parse(redis_entry, symbolize_names: true)
      return Game.from_json(json)
    end
    nil
  end

  def create_game
    game = Game.start(10, 10)
    game.id = SecureRandom.hex(36)
    game.user1 = user_id
    game_id = game.id
    $redis.rpush('waiting_list', game.to_json)
    game
  end
end
