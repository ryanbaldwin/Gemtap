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
    package_name "Gemtap"

    desc "gen [path]", "Renders the single yaml definition, or all definitions in the directory"
    method_options dry: :boolean, output: :string
    def gen(path)
      container = Gemtap::DefinitionContainer.new
      results = container.load(path).render

      unless options[:output] && !options[:dry]
        # rubocop:disable Rails/Output
        results.each { |r| puts r[:result] }
      end
    end
  end
end
