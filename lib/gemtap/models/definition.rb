require 'liquid'

module Gemtap
  class Definition < Liquid::Drop
    attr_reader :model
    attr_reader :props

    def initialize(hash)
      @model = hash['model']
      @props = hash['properties'].map { |prop| Property.new(prop) }
    end
  end
end
