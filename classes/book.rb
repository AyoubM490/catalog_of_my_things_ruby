require './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived: false, id: rand(1..2000))
    @publisher = publisher
    @cover_state = cover_state
    super(publish_date, id: id, archived: archived)
  end

end
