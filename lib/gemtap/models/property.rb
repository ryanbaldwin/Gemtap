require 'liquid'

module Gemtap
  #
  # A Liquid Drop class which represents a model's property
  #
  # @author [ryanbaldwin]
  #
  class Property < Liquid::Drop
    #
    # The name (symbol) of this property
    attr_reader :name

    #
    # The type (Int, String, Bool?, etc) for this property
    attr_reader :type

    attr_reader :default

    #
    # Initializes this Property with a `Mapping of Mappings` yaml sepc.
    # @param prop [[String, {}]] Accepts an array consisting of a String
    # (for the property name), and a hash defining its attributes
    #
    # @return [type] [description]
    def initialize(prop)
      @name, @type = prop.values_at('name', 'type')

      if d = prop['default'] then @default = stringify_if_needed(d) end
    end

    private

    def stringify_if_needed(value)
      return value unless %w(String Char).include?(@type)
      "\"#{value}\""
    end
  end
end
