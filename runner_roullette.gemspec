# -*- encoding: utf-8 -*-
require File.expand_path('../lib/runner_roullette/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["rudedoc"]
  gem.email         = ["finlay.mark@gmail.com"]
  gem.description   = %q{Takes a list of runners and creates a set of derviative prices combining the original runners in a roulette style.}
  gem.summary       = %q{Given an Array of Runner Objects (which have prices) it will return a Table with extra markets similar those found on a roulette table.}
  gem.homepage      = "http://github.com/rudedoc/runner_roulette.git"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "runner_roulette"
  gem.require_paths = ["lib"]
  gem.version       = RunnerRoulette::VERSION
end
