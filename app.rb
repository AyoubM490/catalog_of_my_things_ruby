$LOAD_PATH << '.'
require_relative './classes/book_options'
require './classes/music_album'
require './data_storage'
require 'fileutils'
require 'json'

require_relative './classes/games_module'

class App
  def initialize
    @music_albums_storage = DataStorage.new('./storage/albums.json')

    @books = []
    @games = []
    @music_albums = @music_albums_storage.objects_from_array(@music_albums_storage.read_data) || []
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
    read_games_data
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

  def add_music_album
    p 'Add a publish date'
    publish_date = gets.chomp
    p 'Do you want it to be on spotify?'
    on_spotify = gets.chomp
    music_album = MusicAlbum.new(publish_date, on_spotify)
    @music_albums << (music_album)
    puts "Music Album #{music_album.id} created successfully.\n\n" if @music_albums.push(music_album)
  end

  def list_all_music_albums
    @music_albums.each_with_index do |album, index|
      p "Album number #{index}"
      p "Album's published date : #{album.publish_date}"
      p "The album is #{album.on_spotify ? '' : 'not'}on spotify"
    end
  end

  def write_albums_data
    music_albums = []
    @music_albums.each do |music_album|
      b = {
        'publish_date' => music_album.publish_date,
        'on_spotify' => music_album.on_spotify
      }
      music_albums.push(b) unless music_albums.include?(b)
    end

    FileUtils.mkdir_p('storage')
    File.write('./storage/albums.json', JSON.generate(music_albums), mode: 'w')
  end

  def read_albums_data
    return unless File.exist?('./storage/albums.json')

    music_albums = File.read('./storage/albums.json')
    music_albums = JSON.parse(music_albums)
    music_albums.each do |prop|
      new_album = MusicAlbum.new(prop['publish_date'], prop['on_spotify'])
      @music_albums.push(new_album)
    end
  end

  def list_all_genres
    p 'The genres are : '
    @music_albums.each do |album|
      p album.genre.to_s
    end
  end

  def exit_app
    p 'Thank you for using this app. Have a good day!'
    write_albums_data
    write_books_data
    write_games_data
    exit(true)
  end
end
