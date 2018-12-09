require 'gemtap'

describe Gemtap::DefinitionContainer do
  before(:each) do
    @container = Gemtap::DefinitionContainer.new
    @defs_dir = (__dir__ + '/definitions')
    expect(@container.count).to be 0
  end

  it 'can load a single definition' do
    @container.load("#{@defs_dir}/customer.yml")
    expect(@container.count).to be 1
  end

  it 'can load multiple definitions' do
    expect(@container.load(@defs_dir).count).to be 2
  end

  it 'returns the same number results as templates found' do
    results = @container.load(@defs_dir).render
    expect(results.count).to be 2

    expect(results.first.count).to be > 0
  end
end
