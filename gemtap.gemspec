
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gemtap/version"

Gem::Specification.new do |spec|
  spec.name          = "gemtap"
  spec.version       = Gemtap::VERSION
  spec.authors       = ["ryanbaldwin"]
  spec.email         = ["ryanbaldwin@gmail.com"]

  spec.summary       = "A tool which allows you to generate boilerplate swift from yaml."
  spec.homepage      = "https://github.com/ryanbaldwin/gemtap"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/ryanbaldwin/gemtap"
    spec.metadata["changelog_uri"] = "https://github.com/ryanbaldwin/gemtap/CHANGELOG.md"
    spec.metadata["yard.run"] = "yri" # use "yard" to build full HTML docs.
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "liquid", "~> 4.0"
  spec.add_development_dependency "solargraph", "~>0.29"
  spec.add_dependency "thor", "~>0.20"
end
