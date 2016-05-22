Gem::Specification.new do |s|
  s.name        = 'marigold'
  s.version     = '0.0.2'
  s.date        = '2016-05-21'
  s.summary     = "Test Code Generation"
  s.description = "Marigold is a script built for generating basic CRUD test for an API. Focus is on 
                  generating endpoint tests for Go. The test will be built out to support Ginkgo and 
                  Gomega. Marigold will support Javascript, Elixir, and Ruby in the future."
  s.executables = "marigold"
  s.authors     = ["Nick Rucci"]
  s.email       = 'nick@rucci.io'
  s.files       = ["lib/marigold.rb"]
  s.homepage    =
    'http://rubygems.org/gems/marigold'
  s.license       = 'MIT'
end
