require 'gemtap'

def create_property_of_type(type)
  Gemtap::Property.new(['id', { 'type' => type }])
end

describe Gemtap::Property do
  context 'when initializing' do
    before(:each) do
      @prop = create_property_of_type 'Int'
    end

    it 'has a name' do
      expect(@prop.name).to eq('id')
    end

    it 'has a type' do
      expect(@prop.type).to eq('Int')
    end

    it 'defaults Int properties to 0' do
      expect(@prop.default_value).to eq('0')
    end
  end

  context 'default values' do
    it 'uses the default when provided' do
      prop = Gemtap::Property.new(
        ['id',
          { 'type' => 'Int',
            'default' => '50' }
        ])
        expect(prop.default_value).to eq('50')
    end

    it 'has nil default value when optional and not provided' do
      prop = create_property_of_type('Int?')
      expect(prop.default_value).to be_nil
    end

    it 'defaults UInt to 0' do
      prop = create_property_of_type('UInt')
      expect(prop.default_value).to eq('0')
    end

    it 'defaults Character to empty' do
      prop = create_property_of_type 'Character'
      expect(prop.default_value).to eq('""')
    end

    it 'defaults String properties to empty' do
      prop = create_property_of_type 'String'
      expect(prop.default_value).to eq('""')
    end

    it 'defaults Bool to false' do
      prop = create_property_of_type 'Bool'
      expect(prop.default_value).to eq('false')
    end

    it 'defaults double to 0.0' do
      prop = create_property_of_type 'Double'
      expect(prop.default_value).to eq('0.0')
    end

    it 'defaults CGFloat to 0.0' do
      prop = create_property_of_type 'CGFloat'
      expect(prop.default_value).to eq('0.0')
    end
  end
end
