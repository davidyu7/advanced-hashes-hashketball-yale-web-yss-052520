# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def get_player_attribute(player_name, attribute)
  game_hash.each do |team, team_specs|
    team_specs[:players].each do |player|
      return player[attribute] if player[:player_name] == player_name
    end
  end
end

def num_points_scored(player_name)
  get_player_attribute(player_name, :points)
end

def shoe_size(player_name)
  get_player_attribute(player_name, :shoe)
end

def team_colors(team_name)
  game_hash.each do |team, team_specs|
    return team_specs[:colors] if team_specs[:team_name] == team_name
  end
end

def team_names
  output = []
  game_hash.each do |team, team_specs|
    output << team_specs[:team_name]
  end
  output
end

def player_numbers(team_name)
  output = []
  team = game_hash.select {|team, team_specs| team_specs[:team_name] == team_name}
  team.values[0][:players].each do |player|
    output << player[:number]
  end
  output
end

def player_stats(player_name)
  
=begin
  output = {}
  attribute_list = [:number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks]
  attribute_list.each do |attribute|
    output[attribute] = get_player_attribute(player_name, attribute)
  end
  output
=end
  
  game_hash.each do |team, team_specs|
    team_specs[:players].each do |player|
      return player if player[:player_name] == player_name
    end
  end
  
end

def big_shoe_rebounds
  current_max_shoe = 0
  max_player = nil
  game_hash.each do |team, team_specs|
    team_specs[:players].each do |player|
      if player[:shoe] > current_max_shoe
        current_max_shoe = player[:shoe]
        max_player = player[:player_name]
      end
    end
  end
  get_player_attribute(max_player, :rebounds)
end



