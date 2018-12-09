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
      @core_path = Pathname.new(__dir__ + '/templates/core.liquid')
    end

    def count
      @definitions.count
    end

    #
    # Loads a `Definition` into this container
    #
    # @param [String] path A relative path from the executing directory
    # to the definition to be loaded.
    #
    # @return [DefinitionContainer] This instance of the DefinitionContainer
    #
    def load(path)
      pn = Pathname.new(path)
      if pn.directory?
        filters = ["*.yml", "*.yaml"].map { |glob| Pathname.new("#{path}/#{glob}").expand_path }
        @definitions += filters.map { |f| Pathname.glob(f) { |file| Definition.read(file) } }
      else
        @definitions << Definition.read(pn.expand_path)
      end

      self
    end

    #
    # Renders all of the loaded definitions
    #
    # @return [[]]
    def render
      Liquid::Template.error_mode = :strict
      core = core_template
      @definitions.map { |defn| { definition: defn, result: core.render('defn' => defn) } }
    end

    private

    def core_template
      Liquid::Template.parse(File.read(@core_path.expand_path))
    end
  end
end
