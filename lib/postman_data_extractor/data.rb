module PostmanDataExtractor
  class Data
    attr_reader :collection
    private :collection

    def initialize(collection)
      @collection = collection
    end

    def self.extract(collection)
      new(collection).extract
    end

    def extract
      path.inject({}) do |acc, (key, value)|
        acc[key] = response.dig(*value)
        acc
      end
    end

    private

    def path
      template.path(placeholders, body)
    end

    def response
      HTTParty.get(url)
    end

    def url
      json_collection.fetch('request').fetch('url')
    end

    def placeholders
      template.placeholders(body)
    end

    def template
      @tempalte ||= Template.new
    end

    def body
      JSON.parse(json_collection.fetch('response').first.fetch('body'))
    end

    def json_collection
      JSON.parse(collection).fetch('item').first
    end
  end
end
