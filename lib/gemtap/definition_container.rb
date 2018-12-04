require 'yaml'
require 'pathname'
require 'liquid'

module Gemtap
  #
  # A container into which 1 or more definitions can be loaded
  #
  class DefinitionContainer
    def initialize
      @definitions = []
    end

    #
    # Loads a `Definition` into this container
    #
    # @param [String] path A relative path from the executing directory
    # to the definition to be loaded.
    #
    # @return [<Type>] <description>
    #
    def load(path)
      pn = Pathname.new(path)

      if pn.directory?
        Pathname.glob(pn, ['*.yml', '*.yaml']).map do |file|
          yaml = YAML.safe_load(file.read)
          @definitions << Gemtap::Definitions.new(yaml)
        end
      else
        yaml = YAML.safe_load(pn.read)
        @definitions << Gemtap::Definition.new(yaml)
      end

      return self
    end

    #
    # Renders all of the loaded definitions
    #
    def render
      Liquid::Template.error_mode = :strict
      core = core_template
      @definitions.each { |defn| puts core.render(defn) }
    end

    private

    def core_template
      core_path = Pathname.new('__FILE__').expand_path.dirname.join('templates/core.liquid')
      Liquid::Template.parse(core_path.read)
    end
  end
end
