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

	Describe("GET /api/users/:id", func() {
		Context("with non-existing user", func() {
			It("responds with a 404", func() {

				req, err := http.NewRequest("GET", _SERVER_+"/api/users/0", nil)
				Expect(err).To(BeNil())

				resp, err := client.Do(req)
				Expect(err).To(BeNil())

				Expect(resp.StatusCode).To(Equal(http.StatusNotFound))

			})
		})
		Context("with existing user", func() {
			It("responds with a 200", func() {

				req, err := http.NewRequest("GET", _SERVER_+"/api/users/1", nil)
				Expect(err).To(BeNil())

				resp, err := client.Do(req)
				Expect(err).To(BeNil())

				Expect(resp.StatusCode).To(Equal(http.StatusOK))

			})
		})
	})

	Describe("PUT /api/users/:id", func() {
		Context("with  incorrect user attributes", func() {
			It("responds with a 400", func() {
				reader := bytes.NewReader([]byte(`{
					TODO: JSON Object to POST with
				}`))

				req, err := http.NewRequest("PUT", _SERVER_+"/api/users/1", reader)
				Expect(err).To(BeNil())

				resp, err := client.Do(req)
				Expect(err).To(BeNil())

				Expect(resp.StatusCode).To(Equal(http.StatusBadRequest))

			})
		})
		Context("with correct user attributes", func() {
			It("responds with a 200", func() {
				reader := bytes.NewReader([]byte(`{
					TODO: JSON Object to POST with
				}`))

				req, err := http.NewRequest("PUT", _SERVER_+"/api/users/1", reader)
				Expect(err).To(BeNil())

				resp, err := client.Do(req)
				Expect(err).To(BeNil())

				Expect(resp.StatusCode).To(Equal(http.StatusNoContent))

			})
		})
	})

	Describe("DELETE /api/users/:id", func() {
		Context("with non-existing user", func() {
			It("responds with a 404", func() {

				req, err := http.NewRequest("DELETE", _SERVER_+"/api/users/10200", nil)
				Expect(err).To(BeNil())

				resp, err := client.Do(req)
				Expect(err).To(BeNil())

				Expect(resp.StatusCode).To(Equal(http.StatusNotFound))

			})
		})
		Context("with existing user", func() {
			It("responds with a 204", func() {

				req, err := http.NewRequest("DELETE", _SERVER_+"/api/users/1", nil)
				Expect(err).To(BeNil())

				resp, err := client.Do(req)
				Expect(err).To(BeNil())

				Expect(resp.StatusCode).To(Equal(http.StatusNoContent))

			})
		})
	})
})
