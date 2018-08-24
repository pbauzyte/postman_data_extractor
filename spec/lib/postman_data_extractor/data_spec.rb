require 'spec_helper'

module PostmanDataExtractor
  RSpec.describe Data do
    subject(:data) { Data.new(collection) }

    let(:collection) { Fixtures.collection }
    let(:extracted_data) { { 'temperature' => 280.32, 'pressure' => 1012 } }

    describe '#extract' do
      it 'returns extracted data' do
        expect(data.extract).to eql(extracted_data)
      end
    end
  end
end
