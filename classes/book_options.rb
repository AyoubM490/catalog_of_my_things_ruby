# Create a book.
require_relative './book'
require_relative './author'
require_relative './label'
require 'fileutils'
require 'json'

# Create a book.
def add_book
  print 'Author first name:  '
  first_name = gets.chomp
  print 'Author last name:  '
  last_name = gets.chomp
  print 'Publisher:  '
  publisher = gets.chomp
  print 'Cover State:  '
  cover_state = gets.chomp
  print 'Publish Date (Year):  '
  publish_date = gets.chomp
  print 'Lable (e.g: "gift"):  '
  label = gets.chomp
  print 'Label color:  '
  color = gets.chomp
  author = Author.new(first_name, last_name)
  label = Label.new(label, color)
  new_book = Book.new(publisher, cover_state, publish_date)
  new_book.author = author
  new_book.label = label
  puts "Book #{new_book.id} created successfully.\n\n" if @books.push(new_book)
end

def list_all_books
  @books.each_with_index do |book, index|
    puts "#{index + 1}) Fist Name: #{book.author.first_name}, Last Name: #{book.author.last_name},
   Published by: #{book.publisher} on #{book.publish_date},
   Cover: #{book.cover_state}. \n"
  end
  puts
end

def list_all_labels
  @books.each_with_index { |book, _index| print " \"#{book.label.title}\", " }
  puts
end

def write_books_data
  books = []
  @books.each do |book|
    b = {
      'first_name' => book.author.first_name,
      'last_name' => book.author.last_name,
      'publisher' => book.publisher,
      'publish_date' => book.publish_date,
      'title' => book.label.title,
      'cover_state' => book.cover_state
    }
    books.push(b)
  end

  FileUtils.mkdir_p('storage')
  File.write('./storage/books.json', JSON.generate(books), mode: 'w')
end

def read_book_data
  return unless File.exist?('./storage/books.json')

  books = File.read('./storage/books.json')
  books = JSON.parse(books)
  books.each do |prop|
    new_book = Book.new(prop['publisher'], prop['cover_state'], prop['publish_date'])
    new_book.author = Author.new(prop['first_name'], prop['last_name'])
    new_book.label = Label.new(prop['title'], prop['color'])
    @books.push(new_book)
  end
end
