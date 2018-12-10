require 'gemtap'

def create_property_of_type(type)
  Gemtap::Property.new('name' => 'id', 'type' => type)
end

describe Gemtap::Property do
  context 'when initializing' do
    before(:each) do
      @prop = create_property_of_type('Int')
    end

    it 'has a name' do
      expect(@prop.name).to eq 'id'
    end

    it 'has a type' do
      expect(@prop.type).to eq 'Int'
    end
  end
end
