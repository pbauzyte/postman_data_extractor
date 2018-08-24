require 'spec_helper'

module PostmanDataExtractor
  RSpec.describe Template do
    describe '#placeholders' do
      subject(:template) { Template.new().placeholders(collection) }

      let(:collection) { { 'key' => 'a' } }

      context 'when tmeplate does not have any placeholders' do
        it 'returns all placeholders from template' do
          expect(template).to eql([])
        end
      end

      context 'when template has one placeholder' do
        let(:collection) { { 'key' => '${a}'  } }

        it 'returns an array of placeholder' do
          expect(template).to eq(['a'])
        end
      end

      context 'when template has one placeholder in nested template' do
        let(:collection) do
          {
            'key' => {
              'key01' => '${a}'
            }
          }
        end

        it 'returns an array of placeholder' do
          expect(template).to eq(['a'])
        end
      end

      context 'when template has two placeholders' do
        let(:collection) do
          {
            'key' => {
              'key01' => {
                'key001' => '${a}'
              },
              'key02' => '${b}',
            }
          }
        end

        it 'returns an array of placeholder' do
          expect(template).to eq(['a', 'b'])
        end
      end

      context 'when template holds non string values' do
        let(:collection) { { 'key' => 1.2, 'key1' => '${a}' } }

        it 'does not return placeholder' do
          expect(template).to eql(['a'])
        end
      end

      context 'when marker is in the array' do
        let(:collection) { {'key' => ['1', '${a}'] } }

        it 'returns a placeholder' do
          expect(template).to eql(['a'])
        end
      end
    end
  end
end
