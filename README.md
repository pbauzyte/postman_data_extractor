# PostmanDataExtractor

Explain here

TODO:
* write DEVELOPMENT.md
* Extract JSON chaining to separate module
* Add other data formats e.g (XML, YAML)
* Add Travis for github
* Publish gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'postman_data_extractor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install postman_data_extractor

## Usage

Use it within your project to extract data you want from postman collection

1. Export collection from Postman to JSON file (Collection V2) and store it as a file or json in your database
2. Modify your collection within the response key, values you want to get back from 3rd party API and replace values with the placeholder name you choose and wrap placeholder with '${your_placeholder}':

```
{
...
"body": "{\"main\":{\"temp\":\"${temperature}\",\"pressure\":\"${pressure}\",\"humidity\":81,\"temp_min\":279.15,\"temp_max\":281.15}"
...
}
```

3. Extract the values from real call:
```ruby
require 'postman_data_extractor'

your_json = File.open('your_extracted_collection.json')
# returns specified placeholders and values from real call e.g { 'temperature' => 280.32, 'pressure' => 1012 } 
values = PostmanDataExtractor.extract(your_json)

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pbauzyte/postman_data_extractor. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
