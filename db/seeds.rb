require "faker"

50.times do
  Player.create!(
    name: Faker::Sports::Football.player,
    role: rand(0..3)
  )
end

Player.all.each do |player|
  rand(1..5).times do
    case player.role
    when "Goalkeeper"
      Statistic.create!(
        player: player,
        saves: rand(0..10),
        clearances: rand(0..10),
        shot_blocks: rand(0..10)
      )
    when "Defender"
      Statistic.create!(
        player: player,
        tackles: rand(0..10),
        clearances: rand(0..10),
        interceptions: rand(0..10),
        block_crosses: rand(0..10)
      )
    when "Forward"
      Statistic.create!(
        player: player,
        goals: rand(0..10),
        assists: rand(0..10),
        shots_on_target: rand(0..10),
        successful_dribbles: rand(0..10)
      )
    when "Midfielder"
      Statistic.create!(
        player: player,
        tackles: rand(0..10),
        goals: rand(0..10),
        fouls_won: rand(0..10)
      )
    end
  end
end
