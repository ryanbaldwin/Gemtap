require 'gemtap'

describe Gemtap::Definition do
  context 'when initialized with a hash' do
    before(:each) do
      @definition = Gemtap::Definition.new({
          'model' => 'Customer',
          'properties' => [
            ['id', {'type' => 'Int'}],
            ['name', {'type' => 'String'}],
            ['createdDate', {'type' => 'Date'}]]})
    end

    it 'has a model name' do
      expect(@definition.model).to eq('Customer')
    end

    it 'has properties' do
      expect(@definition.props.count).to eq(3)

      id = @definition.props[0]
      name = @definition.props[1]
      created_date = @definition.props[2]

      expect(id.name).to eq('id')
      expect(id.type).to eq('Int')

      expect(name.name).to eq('name')
      expect(name.type).to eq('String')

      expect(created_date.name).to eq('createdDate')
      expect(created_date.type).to eq('Date')
    end
  end
end
