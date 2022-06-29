# Create a book.
require_relative './book'
require_relative './author'
require_relative './label'

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
    puts "#{index + 1}) Fist Name: \"#{book.author.first_name}, Last Name: #{book.author.last_name},
   Published by: #{book.publisher} on #{book.publish_date},
   Cover: #{book.cover_state}. \n"
  end
  puts
end

def list_all_labels
  @books.each_with_index { |book, _index| print " \"#{book.label.title}\", " }
  puts
end
