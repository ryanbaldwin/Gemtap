require 'yaml'

module Gemtap
  class Loader
    def self.load(path)
      Gemtap::Definition.new(YAML.load(File.read("#{Dir.pwd}/#{path}")))
    end
  end
end