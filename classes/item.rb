class Item
  def initialize(publish_date, id: rand(1..2000), archived: true)
    @id = id
    @archived = archived
    @publish_date = publish_date
  end

  attr_accessor :id, :genre, :author, :label, :publish_date

  def can_be_archived?()
    @publish_date > 10
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end
end
