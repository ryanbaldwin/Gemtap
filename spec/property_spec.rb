require 'gemtap'

describe Gemtap::Property do
  context 'when initializing' do
    before(:each) do
      @prop = Gemtap::Property.new(['id', { 'type' => 'Int' }])
    end

    it 'has a name' do
      expect(@prop.name).to eq('id')
    end

    it 'has a type' do
      expect(@prop.type).to eq('Int')
    end
  end
end
