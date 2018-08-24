module PostmanDataExtractor
  class Chain
    attr_reader :placeholder, :path

    def initialize(placeholder)
      @placeholder = placeholder
      @path = []
      @satisfied = false
    end

    def find(template)
      iterate_template(template) unless @satisfied
      path.clear unless @satisfied

      path.flatten
    end

    private

    def iterate_template(template)
      template.each do |key, value|
        if value.is_a?(Array)
          value = convert_to_hash(value)
        end

        if value.is_a?(Hash)
          p = chain.find(value)

          update_path([key, p]) if !p.empty?
        elsif value == placeholder
          update_path([key])
        end

        if @satisfied
          break
        end
      end
    end

    def chain
      @chain ||= Chain.new(placeholder)
    end

    def update_path(params)
      path << params.tap { @satisfied = true }
    end

    def convert_to_hash(value)
      Hash[(0...value.size).zip(value)]
    end
  end
end
