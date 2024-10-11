class StatisticsApi < Grape::API
  format :json

  helpers do
    def find_player
      @player = Player.find(params[:player_id])
    rescue ActiveRecord::RecordNotFound
      error!("Player not found", 404)
    end
  end

  resource :players do
    desc "Get paginated players"
    paginate per_page: 5
    get do
      players = Player.order(:id)
      paginate(players)
    end

    params do
      requires :player_id, type: Integer
    end
    route_param :player_id do
      before do
        find_player
      end

      desc "Get player rating"
      get :rating do
        rating = $redis.get(@player.id)
        return rating if rating

        @player.rating
      end

      resource :statistics do
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

        desc "Add player statistics"
        post :create do
          if Statistic.create(params)
            CalculateRatingJob.perform_async(@player.id)
          else
            error!({ error: "Statistic has not been created" }, 422)
          end
        end
      end
    end
  end
end
