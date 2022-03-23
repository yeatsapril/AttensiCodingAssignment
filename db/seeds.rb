p "Deleting previous records.."
Player.destroy_all
Playthrough.destroy_all

p "Creating new records.."
player = Player.create!(name: "Attensi")
Playthrough.create!(started_playing: DateTime.now - 1.hour, time_spent: DateTime.now, score: rand(1..100), player_id: player.id)
