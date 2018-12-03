require 'yaml'

module Gemtap
  class Loader
    def self.load(path)
      absolute_path = "#{Dir.pwd}/#{path}"
      Gemtap::Definition.new(YAML.load(File.read(absolute_path)))
    end
  end
end