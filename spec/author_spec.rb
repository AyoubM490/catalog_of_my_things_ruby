require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  before :each do
    @author = Author.new('Mary', 'Poppins')
    # @item = Item.new(2002, false)
  end

  context '#initialize' do
    it 'author should be an instance of Author' do
      expect(@author).to be_an_instance_of Author
    end


    it 'creates a new instance of Author' do
      expect(@author).to be_a(Author)
    end

    it 'expects to add item to items array' do
      @author.add_item(@item)
      expect(@author.items.length).to eq 1
    end
    end
end