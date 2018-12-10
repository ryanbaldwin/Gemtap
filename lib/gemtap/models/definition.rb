require 'liquid'
require 'pathname'
require 'yaml'
require 'pp'

module Gemtap
  class Definition < Liquid::Drop
    attr_reader :model
    attr_reader :properties

    #
    # Reads a yaml definition from file and
    # loads it into a new Definition instance
    # @param path [String] The absolute path of the yaml definition
    #
    # @return [Gemtap::Definition] An instance representation of the yaml
    def self.read(path)
      yaml = YAML.safe_load(File.read(path))
      Definition.new(yaml)
    end

    def initialize(hash)
      model, props = hash.first
      @model = model
      @properties = props["properties"].map { |p| Property.new(p) }
    end
  end
end
