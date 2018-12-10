require 'gemtap'
require 'pp'

describe Gemtap::DefinitionContainer do
  before :each do
    @container = Gemtap::DefinitionContainer.new.load(__dir__ + '/../definitions/customer.yml')
    @rendered = @container.render.first[:result]
  end

  context 'rendered protocol' do
    it 'renders the model as the file name' do
      expect(@rendered.include? 'Customer.swift').to be true
    end

    it 'renders the id property' do
      expect(@rendered.include? 'var id: Int { get set }').to be true
    end

    it 'renders the name property' do
      expect(@rendered.include? 'var name: String { get set }').to be true
    end

    it 'renders the age property' do
      expect(@rendered.include? 'var age: Int { get set }').to be true
    end

    it 'renders the spouse name property' do
      expect(@rendered.include? 'var spouseName: String? { get set }')
    end
  end

  context 'rendered value type' do
    it 'renders the id property' do
      expect(@rendered.include? 'public var id: Int = 0').to be true
    end

    it 'renders the name property' do
      expect(@rendered.include? 'public var name: String = "John Doe"').to be true
    end

    it 'renders the age property' do
      expect(@rendered.include? 'public var age: Int = 40').to be true
    end

    it 'renders the spouse name property' do
      expect(@rendered.include? 'var spouseName: String?')
    end
  end
end
