$LOAD_PATH << '.'
require_relative './classes/book_options'
require_relative 'json_handler'
require_relative './classes/music_album'

class App
  def initialize
    @books = []
    @options = [
      'List all books',
      'List all music albums',
      'List of games',
      'List all genres (e.g "Comedy", "Thriller")',
      'List all labels (e.g. "Gift", "New")',
      'List all authors (e.g. "Stephen King")',
      'Add a book',
      'Add a music album',
      'Add a game',
      'Exit'
    ]
  end

  def run
    read_book_data
    loop do
    @options.each_with_index do |option, index|
      puts "[#{index + 1}]- #{option}"
    end
    user_input
  end
  end

  def user_input
    print 'Please choose an option [1-10] '
    user_choice = gets.chomp.to_i
    operations(user_choice)
  end

  def operations(user_choice)
    case user_choice
    when 1 then list_all_books
    when 2 then list_all_music_albums
    when 3 then list_all_games
    when 4 then list_all_genres
    when 5 then list_all_labels
    when 6 then list_all_authors
    else operations_two(user_choice)
    end
  end

  def operations_two(user_choice)
    case user_choice
    when 7 then add_book
    when 8 then add_music_album
    when 9 then add_game
    when 10 then exit_app
    else p 'Please choose a number between 1-10'
    end
  end

  def add_music_album()
    p 'Add a genre'
    genre = gets.chomp
    p 'Add a publish date'
    publish_date = gets.chomp
    p 'Do you want it to be on spotify?'
    on_spotify = gets.chomp
    music_album = MusicAlbum.new(genre, publish_date, on_spotify)
    @musicAlbums.push(music_album)
  end

  def list_all_music_albums
    @musicAlbums.each_with_index do |album, index|
      p "Album number #{index}"
      p "Album genre : #{album.genre}"
      p "Album's published date : #{album.publish_date}"
      p "The album is #{album.on_spotify ? '' : 'not'} on spotify"
    end
  end

  def list_all_genres
    p 'The genres are : '
    @musicAlbums.each do |album|
      p album.genre.to_s
    end
  end

  def write_data_albums(data)
    File.write('albums.json', JsonHandler.generate_json(data))
  end

  def exit_app
    p 'Thank you for using this app. Have a good day!'
    write_data_albums(@music_albums)
    write_books_data
    exit(true)
  end

  def list_all_authors
    p 'There are no authors here' if @authors.length.zero?
    @authors.each_with_index do |author, index|
      p "[#{index}] - #{author.first_name} #{author.last_name}"
    end
    puts
  end

  def add_game
    print 'Is this game for multiplayers? [Y/N]'
    multiplayer = gets.chomp.downcase
    multiplayer = multiplayer == 'y'
    print 'Please enter the year this game was last played in [YYYY]: '
    last_played_at = gets.chomp.to_i
    print 'Please enter the game published year [YYYY]: '
    publish_date = gets.chomp.to_i
    print 'Has the game been archived [Y/N]: '
    archived = gets.chomp.downcase
    archived = archived == 'y'
    puts 'Choose an author from the following list using the number'
    list_all_authors
    author_chosen = gets.chomp.to_i
    game = Game.new(multiplayer, last_played_at, publish_date, archived)
    game.add_author(@authors[author_chosen])
    @games << game
    p 'The game has been added successfully!'
    puts
  end

  def list_all_games
    p 'There are no games here!' if @games.length.zero?
    @games.each_with_index do |game, index|
      p "[#{index + 1}] - Multiplayer: #{game.multiplayer},
      Last Played: #{game.last_played_at}, Archived: #{game.archived}"
    end
    puts
  end
end
