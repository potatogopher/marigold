# Marigold
[![Gem Version](https://badge.fury.io/rb/marigold.svg)](https://badge.fury.io/rb/marigold)

Marigold is a script built for generating basic CRUD test for an API. Focus is on generating endpoint tests for Go. The test will be built out to support Ginkgo and Gomega. Marigold will support Javascript, Elixir, and Ruby in the future.

## Installation
```bash
gem install marigold
```

## Generating test
Assuming that you have some `*.go` files in your working directory, Marigold will loop through each one of the files and create a new file with the format `<base_name>_test.go`. After generating test into each file, Marigold will call `go fmt` to format the Go code.

```bash
$ ls
user.go post.go

$ marigold
$ ls
user.go user_test.go post.go post_test.go
```

**user.go**
```go
package main_test

import (
	"bytes"
	"net/http"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("User", func() {
	var client = http.Client{}

	Describe("POST /api/users", func() {
		Context("with wrong user attributes", func() {
			It("responds with a 400", func() {
				reader := bytes.NewReader([]byte(`{
					TODO: JSON Object to POST with
				}`))

				req, err := http.NewRequest("POST", _SERVER_+"/api/users", reader)
				Expect(err).To(BeNil())

				resp, err := client.Do(req)
				Expect(err).To(BeNil())

				Expect(resp.StatusCode).To(Equal(http.StatusBadRequest))

			})
		})
		Context("with correct user attributes", func() {
			It("responds with a 201", func() {
				reader := bytes.NewReader([]byte(`{
					TODO: JSON Object to POST with
				}`))

				req, err := http.NewRequest("POST", _SERVER_+"/api/users", reader)
				Expect(err).To(BeNil())

				resp, err := client.Do(req)
				Expect(err).To(BeNil())

				Expect(resp.StatusCode).To(Equal(http.StatusCreated))

			})
		})
	})

...
```

To see entire example, check the examples directory

## Support
Order of Completion
- [x] Go (Ginkgo/Gomega)
- [ ] Javascript
- [ ] Elixir
- [ ] Ruby
