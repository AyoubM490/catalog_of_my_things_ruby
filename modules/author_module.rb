require_relative '../classes/author'

module AuthorModule
  def add_authors(state)
    author_names = ['Stephen King', 'Hermann Hesse', 'J.K Rowling', 'Friedrich Nietzsche']
    author_names.each do |author|
      first_name = author.split[0]
      last_name = author.split[1]
      state[:authors] << Author.new(first_name, last_name)
    end
  end

  def list_all_authors(state)
    p 'There are no authors here' if state[:authors].length.zero?
    state[:authors].each_with_index do |author, index|
      p "[#{index}] - #{author.first_name} #{author.last_name}"
    end
    puts
  end
end
