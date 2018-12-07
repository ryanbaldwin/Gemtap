require 'gemtap'

describe Gemtap::DefinitionContainer do
  before(:each) do
    @container = Gemtap::DefinitionContainer.new
    expect(@container.definitions.count) == 0
  end

  it 'can load a single definition' do
    @container.load('./spec/definitions/customer.yml')
    expect(@container.definitions.count) == 1
  end

  it 'can load multiple definitions' do
    @container.load('./spec/definitions')
    expect(@container.definitions.count) == 2
  end
end
