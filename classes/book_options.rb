# Create a book.
require_relative './book'
require_relative './author'
require_relative './label'

  # Create a book.
  def add_book
    print 'Title:  '
    title = gets.chomp
    print 'Label color:  '
    color = gets.chomp
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
    label = Label.new(title, color)
    new_book = Book.new(publisher, cover_state, publish_date)
    new_book.author = author
    new_book.label = label

    @books.push(new_book)
    puts
    # Puts message when book is created successfully
    puts "Book #{new_book.id} created successfully."
    puts
    puts
  end

  def list_all_books
    @books.each_with_index { |book, index| puts "#{index + 1}) \"#{book.label.title}\" by #{book.author.first_name}, #{book.author.last_name}" }
    puts
  end