require 'json'
require_relative './classes/author'
require_relative './classes/game'


class App
  def initialize
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

    @music_albums = MusicAlbum.read_file(@genres)
    @games = []
    @authors = []
    add_authors
  end

  def add_authors
    @author_names = ['Stephen King', 'Hermann Hesse', 'J.K Rowling', 'Friedrich Nietzsche']
    @author_names.each do |author|
      first_name = author.split[0]
      last_name = author.split[1]
      @authors << Author.new(first_name, last_name)
    end
  end
  

  def run
    @options.each_with_index do |option, index|
      puts "[#{index + 1}]- #{option}"
    end
    user_input
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
    when 10 then exit
    else p 'Please choose a number between 1-10'
    end
  end

  def exit
    p 'Thank you for using this app. Have a good day!'
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
