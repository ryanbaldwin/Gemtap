require 'gemtap'
require 'pathname'

describe Gemtap::Definition do
  before(:each) do
    @definition = Gemtap::Definition.new(
      'Customer' => [
        { 'name' => 'name', 'type' => 'String' },
        { 'name' => 'age', 'type' => 'Int' },
        { 'name' => 'id', 'type' => 'String' },
      ]
    )
  end

  it 'has a model name' do
    expect(@definition.model).to eq 'Customer'
  end

  it 'has properties' do
    expect(@definition.props.count).to be 3
  end

  it 'can load form yaml' do
    pn = Pathname.new(__FILE__).dirname + './definitions/customer.yml'
    @definition = Gemtap::Definition.read(pn.expand_path.cleanpath)
    expect(@definition).to_not be nil
  end
end
