module Gemtap
  class Definition
    def initialize(hash)
      @model = hash['model']
      @props = hash['properties'].map { |prop| Property.new(prop)}
    end
  end
end