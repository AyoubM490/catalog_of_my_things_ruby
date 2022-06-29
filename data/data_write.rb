def save_game
  games = []
  @games.each do |game|
    games.push({ publish_date: game.publish_date, multiplayer: game.multiplayer,
                 last_played_at: game.last_played_at })
  end

  File.write('./storage/games.json', JSON.generate(games))
end

def save_author
  authors = []
  @authors.each do |author|
    authors.push({ first_name: author.first_name, last_name: author.last_name, id: author.id })
  end

  File.write('./storage/authors.json', JSON.generate(authors))
end
