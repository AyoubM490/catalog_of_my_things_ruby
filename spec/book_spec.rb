require_relative '../classes/book'
# require_relative '../classes/item'

describe Book do
  id = rand(1..2000)
  # item = Item.new()
  book_one = Book.new('Oraily', 'papper_back', 2020)
  book_two = Book.new('Penguin', 'hard_back', 2008, archived: true, id: id)
  book_three = Book.new('Oraily', 'bad', 2020)

  describe 'Create Book instance' do
    it 'Return the rigth data' do
      expect(book_one.publisher).to eq('Oraily')
      expect(book_one.publish_date).to eq(2020)
      expect(book_one.cover_state).to eq('papper_back')
      expect(book_one.archived).to eq(false)
    end

    it 'Return the rigth data' do
      expect(book_two.publisher).to eq('Penguin')
      expect(book_two.publish_date).to eq(2008)
      expect(book_two.cover_state).to eq('hard_back')
      expect(book_two.archived).to eq(true)
      expect(book_two.id).to eq(id)
    end
  end

  describe 'can_be_archived?' do
    it 'returns false if the publish date is less then 10 years or cover_state is not "bad"' do
      expect(book_one.can_be_archived?).to eq(false)
    end

    it 'returns true if the publish date is more then 10 years' do
      expect(book_two.can_be_archived?).to eq(true)
    end

    it 'returns true if the cover_state is "bad"' do
      expect(book_three.can_be_archived?).to eq(true)
    end
  end
end
