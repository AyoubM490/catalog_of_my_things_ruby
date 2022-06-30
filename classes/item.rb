require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :id, :genre, :author, :label, :archived

  def initialize(publish_date, id: rand(1..2000), archived: true)
    @id = id
    @archived = archived
    @publish_date = publish_date
  end

  def label=(label)
    return if label.nil?

    @label = label
    label.add_item(self) unless label.items.include? self
  end

  def genre=(genre)
    return if genre.nil?

    @genre = genre
    genre.add_item(self) unless genre.items.include? self
  end

  def author=(author)
    return if author.nil?

    @author = author
    author.add_item(self) unless author.items.include? self
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def can_be_archived?()
    publish_date = Date.today.year - Integer(@publish_date)
    publish_date > 10
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end
end
