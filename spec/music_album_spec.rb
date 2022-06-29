require_relative '../classes/music_album'
require_relative '../classes/item'

describe MusicAlbum do
  context 'Given an item' do
    it 'returns true if the music album can be archived on spotify' do
      item = Item.new('11')
      music_album = MusicAlbum.new('11', true)

      expect(music_album.can_be_archived?(item)).to equal(true)
    end
  end
end
