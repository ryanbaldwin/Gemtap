require 'gemtap/version'
require 'gemtap/definition_container'
require 'gemtap/models/property'
require 'gemtap/models/definition'
require 'thor'

module Gemtap
  class Error < StandardError; end

  #
  # Defines the Command Line Interface for Gemtap
  #
  class CLI < Thor
    desc "hello [name]", "say ny name"
    def hello(name)
      if name == "Heisenberg"
        puts "you are goddamn right"
      else
        puts "say my name"
      end
    end
  end
end
