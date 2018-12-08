require 'gemtap'

describe Gemtap::DefinitionContainer do
  before(:each) do
    @container = Gemtap::DefinitionContainer.new
    expect(@container.count).to(eq(0))
  end

  it 'can load a single definition' do
    @container.load(__dir__ + '/definitions/customer.yml')
    expect(@container.count).to(eq(1))
  end

  it 'can load multiple definitions' do
    defs_path = (__dir__ + '/definitions')
    expect(@container.load(defs_path).count).to(eq(2))
  end
end
