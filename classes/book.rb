require_relative './item'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    super(publish_date)
  end

  def can_be_archived?
    super || cover_state == 'bad' ? true : false
  end
end
