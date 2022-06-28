require_relative '../classes/label'
require_relative '../classes/item'

describe Label do
  label_one = Label.new('Clean Code', 'red', id: 123)
  label_two = Label.new('Clean Code', 'red')
  item = Item.new(2020, id: rand(1..2000), archived: true)

  describe 'Create label instance' do
    it 'Test the label for the right data' do
      expect(label_one.title).to eq('Clean Code')
      expect(label_one.color).to eq('red')
      expect(label_one.id).to eq(123)
    end

    it 'Test the label for the right data' do
      expect(label_two.title).to eq('Clean Code')
      expect(label_two.color).to eq('red')
      expect(label_two.id).to be_a_kind_of(Integer)
    end
  end

  describe 'Test add_item() method' do
    label_one.add_item(item)
    it 'Adds an item' do
      expect(label_one.items[0].class.name).to eq('Item')
      expect(label_one.items[0].label.title).to eq('Clean Code')
      expect(label_one.items[0].label.color).to eq('red')
      expect(label_one.items[0].label.id).to eq(123)
      expect(label_one.items[0].publish_date).to eq(2020)
      expect(label_one.items[0].archived).to eq(true)
    end
  end
end
