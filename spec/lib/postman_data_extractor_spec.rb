require 'spec_helper'

RSpec.describe PostmanDataExtractor do
  subject { PostmanDataExtractor.extract(collection) }

  let(:collection) { Fixtures.collection}

  it 'delegates to Extractor::Data' do
    expect(PostmanDataExtractor::Data).to receive(:extract).with(collection)
    subject
  end
end
