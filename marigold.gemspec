Gem::Specification.new do |s|
  s.name        = 'marigold'
  s.version     = '1.0.1'
  s.date        = '2016-05-23'
  s.summary     = "Test Code Generation"
  s.description = "Marigold is a script built for generating basic CRUD test for an API. Focus is on 
                  generating endpoint tests for Go. Because of this, version 1.0.0 will be able to build
                  very simple endpoint test in Go. The test will be built out to support Ginkgo and 
                  Gomega. Marigold will support Javascript, Elixir, and Ruby in the future."
  s.executables = "marigold"
  s.authors     = ["Nick Rucci"]
  s.email       = 'nick@rucci.io'
  s.files       = ["lib/marigold.rb"]
  s.homepage    =
    'http://rubygems.org/gems/marigold'
  s.license       = 'MIT'
end
