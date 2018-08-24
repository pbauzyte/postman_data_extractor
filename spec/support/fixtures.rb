module Fixtures
  extend self

  def collection
    {
      "variables": [],
      "info": {
        "name": "General API",
        "_postman_id": "d7d3e3e4-8c26-b7d7-575f-ad05ba2c92d0",
        "description": "",
        "schema": "https://schema.getpostman.com/json/collection/v2.0.0/collection.json"
      },
      "item": [
        {
          "name": "http://samples.openweathermap.org/data/2.5/weather?q=Manchester,uk&appid=b6907d289e10d714a6e88b30761fae22",
          "request": {
            "url": "http://samples.openweathermap.org/data/2.5/weather?q=Manchester,uk&appid=b6907d289e10d714a6e88b30761fae22",
            "method": "GET",
            "header": [],
            "body": {},
            "description": ""
          },
          "response": [
            {
              "id": "3db2824e-350e-4cf2-b78b-72d8b0fcd67e",
              "name": "response",
              "originalRequest": {
                "url": "http://samples.openweathermap.org/data/2.5/weather?q=Manchester,uk&appid=b6907d289e10d714a6e88b30761fae22",
                "method": "GET",
                "header": [],
                "body": {}
              },
              "status": "OK",
              "code": 200,
              "_postman_previewlanguage": "json",
              "_postman_previewtype": "text",
              "header": [
                {
                  "key": "Cache-Control",
                  "value": "max-age=0, private, must-revalidate",
                  "name": "Cache-Control",
                  "description": "Tells all caching mechanisms from server to client whether they may cache this object. It is measured in seconds"
                },
                {
                  "key": "Connection",
                  "value": "keep-alive",
                  "name": "Connection",
                  "description": "Options that are desired for the connection"
                },
                {
                  "key": "Content-Encoding",
                  "value": "gzip",
                  "name": "Content-Encoding",
                  "description": "The type of encoding used on the data."
                },
                {
                  "key": "Content-Type",
                  "value": "application/json; charset=utf-8",
                  "name": "Content-Type",
                  "description": "The mime type of this content"
                },
                {
                  "key": "Date",
                  "value": "Sat, 23 Jun 2018 14:14:53 GMT",
                  "name": "Date",
                  "description": "The date and time that the message was sent"
                },
                {
                  "key": "ETag",
                  "value": "W/\"e70c27085ed41de5321252b16c9582fe\"",
                  "name": "ETag",
                  "description": "An identifier for a specific version of a resource, often a message digest"
                },
                {
                  "key": "Server",
                  "value": "openresty/1.9.7.1",
                  "name": "Server",
                  "description": "A name for the server"
                },
                {
                  "key": "Transfer-Encoding",
                  "value": "chunked",
                  "name": "Transfer-Encoding",
                  "description": "The form of encoding used to safely transfer the entity to the user. Currently defined methods are: chunked, compress, deflate, gzip, identity."
                },
                {
                  "key": "X-Content-Type-Options",
                  "value": "nosniff",
                  "name": "X-Content-Type-Options",
                  "description": "The only defined value, \"nosniff\", prevents Internet Explorer from MIME-sniffing a response away from the declared content-type"
                },
                {
                  "key": "X-Frame-Options",
                  "value": "SAMEORIGIN",
                  "name": "X-Frame-Options",
                  "description": "Clickjacking protection: \"deny\" - no rendering within a frame, \"sameorigin\" - no rendering if origin mismatch"
                },
                {
                  "key": "X-Request-Id",
                  "value": "6e513491-e99f-4e41-aefb-8fce41457b90",
                  "name": "X-Request-Id",
                  "description": "Custom header"
                },
                {
                  "key": "X-Runtime",
                  "value": "0.001059",
                  "name": "X-Runtime",
                  "description": "Custom header"
                },
                {
                  "key": "X-XSS-Protection",
                  "value": "1; mode=block",
                  "name": "X-XSS-Protection",
                  "description": "Cross-site scripting (XSS) filter"
                }
              ],
              "cookie": [],
              "responseTime": 104,
              "body": "{\"coord\":{\"lon\":12,\"lat\":51.51},\"weather\":[{\"id\":300,\"main\":\"Drizzle\",\"description\":\"light intensity drizzle\",\"icon\":\"09d\"}],\"base\":\"stations\",\"main\":{\"temp\":\"${temperature}\",\"pressure\":\"${pressure}\",\"humidity\":81,\"temp_min\":279.15,\"temp_max\":281.15},\"visibility\":10000,\"wind\":{\"speed\":4.1,\"deg\":80},\"clouds\":{\"all\":90},\"dt\":1485789600,\"sys\":{\"type\":1,\"id\":5091,\"message\":0.0103,\"country\":\"GB\",\"sunrise\":1485762037,\"sunset\":1485794875},\"id\":2643743,\"name\":\"London\",\"cod\":200}"
            }
          ]
        }
      ]
    }.to_json
  end
end
