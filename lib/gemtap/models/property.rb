module Gemtap
  class Property
    def name
      @name
    end

    def type
      @attrs['type']
    end

    def default_value
      return @attrs['default'] if @attrs.key?['default']
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
      when :int then '0'
      when :string then ''
      when :bool then 'false'
      when :double then '0.0'
      when :cgfloat then '0.0'
      end
    end
  end
end
