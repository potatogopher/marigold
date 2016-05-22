require 'active_support/inflector'

# Loop through each file with extension .go and create a
# test file in the format "<filename>_test.go". Then
# Generate code based on file name.
Dir.glob("./*.go") do |file|
  base = File.basename(file, File.extname(file))
  File.open(base + "_test.go", "w") { |f|
    # model name config
    upcase_name = base.slice(0,1).capitalize + base.slice(1..-1)
    plural_name = base.pluralize

    # Test Suite to generate
    f.write('package main_test')
    f.puts @string

    f.write('import (')
    f.puts @string
    f.write('	"bytes"')
    f.puts @string
    f.write('	"net/http"')
    f.puts @string
    f.puts @string

    f.write('	. "github.com/onsi/ginkgo"')
    f.puts @string
    f.write('	. "github.com/onsi/gomega"')
    f.puts @string
    f.write(')')
    f.puts @string
    f.puts @string

    f.write('var _ = Describe("'+upcase_name+'", func() {')
    f.write('	var client = http.Client{}')
    f.puts @string
    f.puts @string

    f.write('	Describe("POST /api/'+plural_name+'", func() {')
    f.puts @string
    f.write('		Context("with wrong '+base+' attributes", func() {')
    f.puts @string
    f.write('			It("responds with a 400", func() {')
    f.puts @string
    f.write('				reader := bytes.NewReader([]byte(`{')
    f.puts @string
    f.write('					TODO: JSON Object to POST with')
    f.puts @string
    f.write('				}`))')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("POST", _SERVER_+"/api/'+plural_name+'", reader)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				resp, err := client.Do(req)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				Expect(resp.StatusCode).To(Equal(http.StatusBadRequest))')
    f.puts @string
    f.puts @string
    f.write('			})')
    f.puts @string
    f.write('		})')
    f.puts @string
    f.write('		Context("with correct '+base+' attributes", func() {')
    f.puts @string
    f.write('			It("responds with a 201", func() {')
    f.puts @string
    f.write('				reader := bytes.NewReader([]byte(`{')
    f.puts @string
    f.write('					TODO: JSON Object to POST with')
    f.puts @string
    f.write('				}`))')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("POST", _SERVER_+"/api/'+plural_name+'", reader)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				resp, err := client.Do(req)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				Expect(resp.StatusCode).To(Equal(http.StatusCreated))')
    f.puts @string
    f.puts @string
    f.write('			})')
    f.puts @string
    f.write('		})')
    f.puts @string
    f.write('	})')
    f.puts @string
    f.puts @string

    f.write('	Describe("GET /api/'+plural_name+'/:id", func() {')
    f.puts @string
    f.write('		Context("with non-existing '+base+'", func() {')
    f.puts @string
    f.write('			It("responds with a 404", func() {')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("GET", _SERVER_+"/api/'+plural_name+'/0", nil)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				resp, err := client.Do(req)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				Expect(resp.StatusCode).To(Equal(http.StatusNotFound))')
    f.puts @string
    f.puts @string
    f.write('			})')
    f.puts @string
    f.write('		})')
    f.puts @string
    f.write('		Context("with existing '+base+'", func() {')
    f.puts @string
    f.write('			It("responds with a 200", func() {')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("GET", _SERVER_+"/api/'+plural_name+'/1", nil)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				resp, err := client.Do(req)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				Expect(resp.StatusCode).To(Equal(http.StatusOK))')
    f.puts @string
    f.puts @string
    f.write('			})')
    f.puts @string
    f.write('		})')
    f.puts @string
    f.write('	})')
    f.puts @string
    f.puts @string

    f.write('	Describe("PUT /api/'+plural_name+'/:id", func() {')
    f.puts @string
    f.write('		Context("with  incorrect '+base+' attributes", func() {')
    f.puts @string
    f.write('			It("responds with a 400", func() {')
    f.puts @string
    f.write('				reader := bytes.NewReader([]byte(`{')
    f.puts @string
    f.write('					TODO: JSON Object to POST with')
    f.puts @string
    f.write('				}`))')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("PUT", _SERVER_+"/api/'+plural_name+'/1", reader)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('')
    f.puts @string
    f.write('				resp, err := client.Do(req)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				Expect(resp.StatusCode).To(Equal(http.StatusBadRequest))')
    f.puts @string
    f.puts @string
    f.write('			})')
    f.puts @string
    f.write('		})')
    f.puts @string
    f.write('		Context("with correct '+base+' attributes", func() {')
    f.puts @string
    f.write('			It("responds with a 200", func() {')
    f.puts @string
    f.write('				reader := bytes.NewReader([]byte(`{')
    f.puts @string
    f.write('					TODO: JSON Object to POST with')
    f.puts @string
    f.write('				}`))')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("PUT", _SERVER_+"/api/'+plural_name+'/1", reader)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				resp, err := client.Do(req)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				Expect(resp.StatusCode).To(Equal(http.StatusNoContent))')
    f.puts @string
    f.write('')
    f.puts @string
    f.write('			})')
    f.puts @string
    f.write('		})')
    f.puts @string
    f.write('	})')
    f.puts @string
    f.puts @string

    f.write('	Describe("DELETE /api/'+plural_name+'/:id", func() {')
    f.puts @string
    f.write('		Context("with non-existing '+base+'", func() {')
    f.puts @string
    f.write('			It("responds with a 404", func() {')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("DELETE", _SERVER_+"/api/'+plural_name+'/10200", nil)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				resp, err := client.Do(req)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				Expect(resp.StatusCode).To(Equal(http.StatusNotFound))')
    f.puts @string
    f.puts @string
    f.write('			})')
    f.puts @string
    f.write('		})')
    f.puts @string
    f.write('		Context("with existing '+base+'", func() {')
    f.puts @string
    f.write('			It("responds with a 204", func() {')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("DELETE", _SERVER_+"/api/'+plural_name+'/1", nil)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				resp, err := client.Do(req)')
    f.puts @string
    f.write('				Expect(err).To(BeNil())')
    f.puts @string
    f.puts @string
    f.write('				Expect(resp.StatusCode).To(Equal(http.StatusNoContent))')
    f.puts @string
    f.puts @string
    f.write('			})')
    f.puts @string
    f.write('		})')
    f.puts @string
    f.write('	})')
    f.puts @string
    f.write('})')
  }

  # Format the test suite code
  system "go fmt"
end
