# Create a book.
require_relative './book'
require_relative './author'

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
    author = Author.new(first_name, last_name)
    new_book = Book.new(publisher, cover_state, publish_date)
    new_book.author = author

    @books.push(new_book)
    puts
    # Puts message when book is created successfully
    puts "Book #{new_book.id} created successfully."
    puts
    puts
  end

  def list_all_books
    @books.each_with_index { |book, index| puts "#{index + 1}) first name: #{book.author.first_name}" }
    puts
  end