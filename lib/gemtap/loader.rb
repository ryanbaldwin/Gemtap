require 'yaml'

module Gemtap
  class Loader
    def self.load(path)
      return YAML.load(File.read("#{Dir.pwd}/#{path}"))
    end
  end
end