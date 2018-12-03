module Gemtap
  class Property
    def name
      @name
    end

    def type
      @type
    end

    def initialize(prop)
      @name = prop.first
      @type = prop.last['type']
    end
  end
end