require 'gemtap'
require 'pathname'

describe Gemtap::Definition do
  it 'can load form yaml' do
    pn = Pathname.new(__FILE__).dirname + './definitions/customer.yml'
    @definition = Gemtap::Definition.read(pn.expand_path.cleanpath)
    expect(@definition).to_not be nil

    expect(@definition.model).to eq "Customer"
    expect(@definition.properties.count).to be 4
  end
end
