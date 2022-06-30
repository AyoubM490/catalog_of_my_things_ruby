require 'json'

def read_authors
  return [] unless File.exist?('./storage/authors.json')

  JSON.parse(File.read('./storage/authors.json')).map do |author|
    Author.new(author['first_name'], author['last_name'], author['id'])
  end
end

def read_games
  return [] unless File.exist?('./storage/games.json')

  JSON.parse(File.read('./storage/games.json')).map do |game|
    Game.new(game['publish_date'], game['multiplayer'], game['last_played_at'])
  end
end
