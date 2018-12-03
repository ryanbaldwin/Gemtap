require 'gemtap'

describe Gemtap::Loader do
  context 'when definition is not found' do
    it 'raises' do
      expect { Gemtap::Loader.load("nonexistent.yaml") }.to raise_error(Errno::ENOENT)
    end
  end

  context 'when definition is found' do
    it 'parses' do
      parsed = Gemtap::Loader.load('spec/definitions/customer.yaml')
      expect(parsed['model']).to eq('Customer')

      props = parsed['properties']
      expect(props.count).to eq(3)
    end
  end
end 