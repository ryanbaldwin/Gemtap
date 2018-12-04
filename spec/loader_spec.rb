require 'gemtap'

describe Gemtap::Loader do
  context 'when definition is not found' do
    it 'raises' do
      expect { Gemtap::Loader.load('nonexistent.yaml') }.to raise_error(Errno::ENOENT)
    end
  end

  context 'when definition is found' do
    it 'parses it into a definition' do
      defn = Gemtap::Loader.load('spec/definitions/customer.yaml')
      expect(defn.model).to eq('Customer')
      expect(defn.props.count).to eq(3)
    end
  end
end
