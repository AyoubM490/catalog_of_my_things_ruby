$LOAD_PATH << '.'
require_relative '../classes/genre'
require_relative '../classes/item'

describe Genre do
  context 'Given an item object' do
    it 'adds the item object to the items list' do
      item = Item.new('11')
      genre = Genre.new('comedy')

      genre.add_item(item)

      expect(genre.items).to_not be_empty
      expect(genre.items.first).to equal(item)
    end
  end
end
