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
        Pathname.glob(pn, ['*.yml', '*.yaml']).map { |file| load_file(file) }
      else
        load_file(pn)
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

    def load_file(file)
      yaml = YAML.safe_load(pathname.read)
      @definitions << Gemtap::Definition.new(yaml)
    end

    def core_template
      core_path = File.join(File.dirname(File.expand_path(__FILE__)), './templates/core.liquid')
      Liquid::Template.parse(File.read(core_path))
    end
  end
end
