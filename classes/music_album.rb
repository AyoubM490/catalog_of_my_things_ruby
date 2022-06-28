require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify
  
  def initialize(genre, publish_date, on_spotify, id: rand(1..2000), archived: true)
    super(genre, publish_date, id: id, archived: archived)
    @on_spotify = on_spotify
  end

  # private
  
  def can_be_archived?(item)
    item.can_be_archived?() && on_spotify
  end

  def to_hash
    hash = {}
    hash[:class] = self.class
    hash[:genre] = @genre
    hash[:publish_date] = @publish_date
    hash[:id] = @id
    hash[:archived] = @archived
    hash[:on_spotify] = @on_spotify
    hash
  end

  def self.create_from_hash(hash)
    MusicAlbum.new(hash['genre'], hash['publish_date'], hash['on_spotify'], hash['id'], hash['archived'])
  end
end