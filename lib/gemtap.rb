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
    desc "gen [defn_path]", "generates the single yaml definition, or all definitions in the directory"
    def gen(defn_path)
      container = Gemtap::DefinitionContainer.new
      container.load(defn_path).render
    end
  end
end
