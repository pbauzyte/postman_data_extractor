module PostmanDataExtractor
  class Template
    def placeholders(template)
      if template.is_a?(String)
        placeholder(template) if template.start_with? '${'
      else
        template.map do |key, value|
          if value.is_a?(Array)
            value = convert_to_hash(value)
          end

          if value.is_a?(Hash)
            placeholders(value)
          elsif value.is_a?(String)
            placeholder(value) if value.start_with? '${'
          end
        end.compact.flatten
      end
    end

    def path(placeholders, template)
      placeholders.inject({}) do |acc, placeholder|
        acc[placeholder] = Chain.new(marker(placeholder)).find(template)
        acc
      end
    end

    private

    def marker(input)
      "${#{input}}"
    end

    def placeholder(input)
      input[/#{Regexp.escape('${')}(.*?)#{Regexp.escape('}')}/m, 1]
    end

    def convert_to_hash(value)
      Hash[(0...value.size).zip(value)]
    end
  end
end
