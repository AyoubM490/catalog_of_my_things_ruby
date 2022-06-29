require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  # private

  def can_be_archived?(item)
    item.can_be_archived? && on_spotify
  end

  attr_reader :publish_date

  def to_hash
    hash = {}
    hash[:publish_date] = @publish_date
    hash[:on_spotify] = @on_spotify
    hash
  end

  def self.create_from_hash(hash)
    MusicAlbum.new(hash['publish_date'], hash['on_spotify'])
  end
end
