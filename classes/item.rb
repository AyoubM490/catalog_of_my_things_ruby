class Item
  def initialize(genre, publish_date, id: rand(1..2000), archived: true)
    @id = id
    @archived = archived
    @genre = genre
    @publish_date = publish_date
    @archives = []
  end

  attr_accessor :id, :publish_date, :archived

  attr_reader :genre, :author, :label

  # private

  def can_be_archived?()
    Integer(@publish_date) > 10
  end

  def move_to_archive(music_album)
    @archives.push(music_album) unless @archives.include?(music_album)
  end

  def list_music_albums()
    @archives
  end

  def list_genres()
    genres = []
    @archives.each do |archive|
      genres.push(archive.genre)
    end
    genres
  end
end
