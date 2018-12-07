require 'yaml'
require 'pathname'
require 'liquid'

module Gemtap
  #
  # A container into which 1 or more definitions can be loaded
  #
  class DefinitionContainer
    attr_reader :definitions

    def initialize
      @definitions = []
      @core_template = Pathname.new(__FILE__).dirname + './templates/core.liquid'
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
      if pn.directory? do
        pathnames = ["*.yml", "*.yaml"].map { |glob| Pathname.new("#{path}/#{glob}").expand_path }
        pathnames.each { |pn| @definitions += Pathname.glob(pn) { |file| Definition.read(file) }}
      end
      else
        @definitions << Definition.read(pn.expand_path)
      end

      self
    end

    #
    # Renders all of the loaded definitions
    #
    def render
      Liquid::Template.error_mode = :strict
      core = core_template

      @definitions.each do |defn|
        puts core.render('defn' => defn)
      end
    end

    private

    def core_template
      Liquid::Template.parse(File.read(@core_path.expand_path))
    end
  end
end
