require_relative '../classes/game'
require_relative './author_module'

module GamesModule
  include AuthorModule

  def add_game(state)
    print 'Is this game for multiple players? [Y/N]: '
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == 'y'
    print 'Please enter the date this game was last played in [YYYY-MM-DD]: '
    last_played_at = gets.chomp
    print 'In which date was this game published? [YYYY-MM-DD]: '
    publish_date = gets.chomp
    print 'Has this game been archived? [Y/N]: '
    archived = gets.chomp.downcase
    archived = archived == 'y'
    puts 'Choose an author from the following list using the number'
    list_all_authors(state)
    author_chosen = gets.chomp.to_i
    game = Game.new(multiplayer, last_played_at, publish_date, archived)
    game.add_author(state[:authors][author_chosen])
    state[:games] << game
    p 'The game has been added successfully!'
    puts
  end

  def list_all_games(state)
    p 'There are no games here!' if state[:games].length.zero?
    state[:games].each_with_index do |game, index|
      print "[#{index + 1}] - Multiplayer: #{game.multiplayer}, "
      puts "Last Played: #{game.last_played_at}, Archived: #{game.archived}"
    end
    puts
  end
end
