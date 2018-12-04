require 'liquid'

module Gemtap
  class Property < Liquid::Drop
    def name
      @name
    end

    def type
      @attrs['type']
    end

    def default_value
      return @attrs['default'] if @attrs.key?('default')
      return nil if type.end_with? '?'

      default_value_for(type.downcase.to_sym)
    end

    def initialize(prop)
      @name = prop.first
      @attrs = prop.last
    end

    private

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
