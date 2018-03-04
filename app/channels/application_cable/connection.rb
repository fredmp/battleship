module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :user_id, :game_id

    def connect
      self.user_id = SecureRandom.hex(36)
    end
  end
end
