class Item
  def initialize(genre, author, source, label, publish_date)
    @id = rand(1..1000)
    @archived = true
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
  end

  attr_accessor :genre, :author, :source, :label, :publish_date

  def can_be_archived?; end

  def move_to_archive; end
end
