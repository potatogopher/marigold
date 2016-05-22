#require 'active_support/inflector'

Dir.glob("./*.go") do |file|
  base = File.basename(file, File.extname(file))
  File.open(base + "_test.go", "w") { |f|
    # model name config
    upcase_name = base.slice(0,1).capitalize + base.slice(1..-1)

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
    
    f.write('var _ = Describe("Actor", func() {')
    f.write('	var client = http.Client{}')
    f.puts @string
    f.puts @string

    f.write('	Describe("POST /api/actors", func() {')
    f.puts @string
    f.write('		Context("with wrong actor attributes", func() {')
    f.puts @string
    f.write('			It("responds with a 400", func() {')
    f.puts @string
    f.write('				reader := bytes.NewReader([]byte(`{')
    f.puts @string
    f.write('					"nae": "foo"')
    f.puts @string
    f.write('				}`))')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("POST", mockServer.URL+"/api/actors", reader)')
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
    f.write('		Context("with correct actor attributes", func() {')
    f.puts @string
    f.write('			It("responds with a 201", func() {')
    f.puts @string
    f.write('				reader := bytes.NewReader([]byte(`{')
    f.puts @string
    f.write('					"name": "foo"')
    f.puts @string
    f.write('				}`))')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("POST", mockServer.URL+"/api/actors", reader)')
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

    f.write('	Describe("GET /api/actors/:id", func() {')
    f.puts @string
    f.write('		Context("with non-existing actor", func() {')
    f.puts @string
    f.write('			It("responds with a 404", func() {')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("GET", mockServer.URL+"/api/actors/0", nil)')
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
    f.write('		Context("with existing actor", func() {')
    f.puts @string
    f.write('			It("responds with a 200", func() {')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("GET", mockServer.URL+"/api/actors/1", nil)')
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
    
    f.write('	Describe("PUT /api/actors/:id", func() {')
    f.puts @string
    f.write('		Context("with  incorrect actor attributes", func() {')
    f.puts @string
    f.write('			It("responds with a 400", func() {')
    f.puts @string
    f.write('				reader := bytes.NewReader([]byte(`{')
    f.puts @string
    f.write('					"nae": "foo"')
    f.puts @string
    f.write('				}`))')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("PUT", mockServer.URL+"/api/actors/1", reader)')
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
    f.write('		Context("with correct actor attributes", func() {')
    f.puts @string
    f.write('			It("responds with a 200", func() {')
    f.puts @string
    f.write('				reader := bytes.NewReader([]byte(`{')
    f.puts @string
    f.write('					"name": "foo"')
    f.puts @string
    f.write('				}`))')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("PUT", mockServer.URL+"/api/actors/1", reader)')
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

    f.write('	Describe("DELETE /api/actors/:id", func() {')
    f.puts @string
    f.write('		Context("with non-existing actor", func() {')
    f.puts @string
    f.write('			It("responds with a 404", func() {')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("DELETE", mockServer.URL+"/api/actors/10200", nil)')
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
    f.write('		Context("with existing actor", func() {')
    f.puts @string
    f.write('			It("responds with a 204", func() {')
    f.puts @string
    f.puts @string
    f.write('				req, err := http.NewRequest("DELETE", mockServer.URL+"/api/actors/1", nil)')
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

  system "go fmt"
end
