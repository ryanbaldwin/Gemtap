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
    # The type (Int, String, Bool?, etc) for this
    #
    # @return [String] The property type
    def type
      @attrs['type']
    end

    #
    # The default value specified for this value, if one exists.
    # If the property is not an Optional, and no default is provided,
    # then `default_value` will attempt to provide one for you which
    # is `empty'ish`. For example, a required `Bool` will be assigned
    # `false`, `Double`s 0, etc.
    #
    # @return [string] The provided default value for this property, if
    # one was specified; otherwise if the property is required a sensible
    # default will be returned; otherwise nil.
    def default_value
      return @attrs['default'] if @attrs.key?('default')
      return nil if type.end_with? '?'

      default_value_for(type.downcase.to_sym)
    end

    #
    # Initializes this Property with a `Mapping of Mappings` yaml sepc.
    # @param prop [[String, {}]] Accepts an array consisting of a String
    # (for the property name), and a hash defining its attributes
    #
    # @return [type] [description]
    def initialize(prop)
      @name = prop.first
      @attrs = prop.last
    end

    private

    #
    # Given a type, returns an appropriate, minimum viable value
    # @param type [String] the type (eg. 'Int') of this property
    #
    # @return [String] A default value for this property
    def default_value_for(type)
      case type.downcase.to_sym
      when :bool then 'false'
      when :cgfloat then '0.0'
      when :character then '""'
      when :date then 'Date()'
      when :double then '0.0'
      when :int then '0'
      when :string then '""'
      when :uint then '0'
      end
    end
  end
end
