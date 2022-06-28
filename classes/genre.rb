$LOAD_PATH << '.'
require_relative './item'

class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
    @genres = []
  end

  def add_genre(genre)
    @genres.push(genre) unless @genres.include?(genre)
    genre.item(self)
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.genre = self
  end
end
