require_relative '../classes/game'

def add_game
  print 'Is this game for multiple players? [Y/N]: '
  multiplayer = gets.chomp.downcase
  multiplayer = multiplayer == 'y'
  print 'Please enter the date this game was last played in [YYYY]: '
  last_played_at = gets.chomp
  print 'In which date was this game published? [YYYY]: '
  publish_date = gets.chomp
  print 'Has this game been archived? [Y/N]: '
  archived = gets.chomp.downcase
  puts 'Enter author first name: '
  author_first = gets.chomp
  puts 'Enter author last name: '
  author_last = gets.chomp
  author = Author.new(author_first, author_last)
  game = Game.new(multiplayer, last_played_at, publish_date, archived)
  game.author = author
  @games.push(game)
  p 'The game has been added successfully!'
  puts
end

def list_all_games
  p 'There are no games here!' if @games.length.zero?
  @games.each_with_index do |game, index|
    print "[#{index + 1}] - Multiplayer: #{game.multiplayer}, "
    puts "Last Played: #{game.last_played_at}, Archived: #{game.archived}"
  end
  puts
end

def list_all_authors
  p 'There are no authors here!' if @games.length.zero?
  @games.each_with_index do |game, index|
    puts "#{index + 1} - #{game.author.first_name}, #{game.author.last_name}"
  end
  puts
end
