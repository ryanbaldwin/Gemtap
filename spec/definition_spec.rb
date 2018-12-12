require 'gemtap'
require 'pathname'

describe Gemtap::Definition do
  before(:each) do
    pn = Pathname.new(__FILE__).dirname + './definitions/customer.yml'
    @definition = Gemtap::Definition.read(pn.expand_path.cleanpath)
  end
  
  it 'can load form yaml' do
    expect(@definition).to_not be nil
  end

  it 'loads the model name' do
    expect(@definition.model).to eq 'Customer'
  end

  it 'loads properties' do
    expect(@definition.properties.count).to be 4
  end

  it 'loads protocol conformance' do
    expect(@definition.conforms_to.count).to be 1
    expect(@definition.encodable?).to be true
  end

end
