require 'pry'
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def num_points_scored(player)
  players.each do |player_name, stat|
    if player_name == player
      return stat[:points]
    end
  end
end

def shoe_size(player)
  players.each do |player_name, stat|
    if player_name == player
      return stat[:shoe]
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    team_data.each do |data_type, data|
      if data_type.to_s == "team_name"
        if data == team
          return team_data[:colors]
        end
      end
    end
  end
end

def team_names
  teams = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
  teams
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |data_type, data|
      if data_type.to_s == "team_name"
        if data == team
          team_data[:players].each do |player_name, stat|
            numbers << stat[:number]
          end
        end
      end
    end
  end
  return numbers
end

def player_stats(player)
  players.each do |player_name, stat|
    if player_name == player
      return players[player_name]
    end
  end
end

def big_shoe_rebounds
  shoe_sizes = {}
  players.each do |player_name, stat|
    shoe_sizes[player_name] = stat[:shoe]
  end
  biggest_shoe_player = shoe_sizes.max_by{|name, size| size}[0]
  players.each do |player_name, stat|
    if player_name == biggest_shoe_player
      return stat[:rebounds]
    end
  end
end

def most_points_scored
  points_scored = {}
  players.each do |player_name, stat|
    points_scored[player_name] = stat[:points]
  end
  points_scored.max_by{|name, points| points}[0]
end

def winning_team
  home_points = []
  away_points = []
  game_hash[:home][:players].each do |player_name, stat|
    home_points << stat[:points]
  end
  game_hash[:away][:players].each do |player_name, stat|
    away_points << stat[:points]
  end
  if home_points.inject(0, :+) > away_points.inject(0, :+)
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
player_names = []
  players.each do |player_name, stat|
    player_names << player_name
  end
player_names.max_by(&:length)
end

def long_name_steals_a_ton?
  steals_hash = {}
  players.each do |player_name, stat|
    steals_hash[player_name] = stat[:steals]
  end
  steals_hash.max_by{|name, number| number}[0] == player_with_longest_name
end
