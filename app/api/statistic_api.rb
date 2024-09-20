class StatisticApi < Grape::API
  format :json

  resource :statistic do
    params do
      requires :player_id, type: Integer
      optional :goals, type: Integer
      optional :saves, type: Integer
      optional :clearances, type: Integer
      optional :tackles, type: Integer
      optional :interceptions, type: Integer
      optional :block_crosses, type: Integer
      optional :assists, type: Integer
      optional :shots_on_target, type: Integer
      optional :successful_dribbles, type: Integer
      optional :shot_blocks, type: Integer
      optional :fouls_won, type: Integer
    end
    # {player_id: 1,
    #  goals: 2,
    #  saves: 4}
    desc "Received information about the player"
    patch :player_info do
      Statistic.create(params)
    end
  end
end
