require 'liquid'

module Gemtap
  class Definition < Liquid::Drop
    def model 
      @model
    end

    def props
      @props
    end

    def initialize(hash)
      @model = hash['model']
      @props = hash['properties'].map { |prop| Property.new(prop) }
    end
  end
end