Dir.glob("./*.go") do |file|
  base = File.basename(file, File.extname(file))
  File.open(base + "_test.go", "w") { |f| 
    # model name config
    upcase_name = base.slice(0,1).capitalize + base.slice(1..-1)

    f.write('package main_test')
    f.puts @string

    f.write('import (')
    f.puts @string
    f.write('. "github.com/onsi/ginkgo"')
    f.puts @string
    f.write('. "github.com/onsi/gomega"')
    f.puts @string
    f.write(')')
    f.puts @string

    f.write('var _ = Describe("'+upcase_name+'", func() {')
    f.puts @string
    f.puts @string
    f.write('})')
  }

  system "go fmt"
end
