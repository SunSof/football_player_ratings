class CalculateRatingJob
  include Sidekiq::Job
  queue_as :default
  sidekiq_options retry: false

  def perform(player_id)
    player = Player.find(player_id)
    $redis.set(player_id, player.rating) if player
  end
end
