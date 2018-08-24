require 'spec_helper'

module PostmanDataExtractor
	RSpec.describe Chain do
		subject(:chain) { Chain.new(placeholder) }

		let(:template) { {} }
		let(:placeholder) { 'a' }

		describe '#chain' do
			subject { chain.find(template) }

			it 'returns path to that placeholder' do
				expect(subject).to eql([])
			end

			context 'when template is non empty' do
				let(:template) { { 'key1' => 'a'} }

				it 'returns path to that placeholder' do
					expect(subject).to eql(['key1'])
				end
			end

			context 'when template is nested' do
				let(:template) do
					{
						'key' => {
							'key1' => 'a'
						}
					}
				end

				it 'returns path to that placeholder' do
					expect(subject).to eql(['key', 'key1'])
				end
			end

			context 'when template is nested' do
				let(:template) do
					{
						'key2' => 'b',
						'key' => {
							'key1' => 'a'
						}
					}
				end

				it 'returns path to that placeholder' do
					expect(subject).to eql(['key', 'key1'])
				end
			end

			context 'when template is nested' do
				let(:template) do
					{
						'key2' => {
							'key22' => 'b',
						},
						'key' => {
							'key1' => 'a'
						}
					}
				end

				it 'returns path to that placeholder' do
					expect(subject).to eql(['key', 'key1'])
				end
			end

			context 'when template is nested' do
				let(:template) do
					{
						'key' => {
							'key01' => 'b',
							'key1' => 'a'
						}
					}
				end

				it 'returns path to that placeholder' do
					expect(subject).to eql(['key', 'key1'])
				end
			end

			context 'when template is so complex it hurts' do
				let(:template) do
					{
						'key3' => 'b',
						'key2' => {
							'key22' => 'b',
						},
						'key4' => 'b',
						'key' => {
							'key00' => {
								'key000' => 'b'
							},
							'key01' => {
								'key001' => 'b',
								'key1' => 'a',
								'key0011' => 'b',
							}
						},
						'key5' => 'b'
					}
				end

				it 'returns path to that placeholder' do
					expect(subject).to eql(['key', 'key01', 'key1'])
				end
			end

			context 'when template has an array of more elements in it but no placeholder' do
				let(:template) do
					{
						'key3' => 'b',
						'key2' => {
							'key22' => 'b',
						},
						'key4' => 'b',
						'key' => {
							'key01' => {
								'key001' => 'b',
								'key1' => 'b',
								'key0011' => 'b',
							},
							'key5' => 'a'
						},
					}
				end

				it 'returns path to that placeholder' do
					expect(subject).to eql(['key', 'key5'])
				end
			end

			context 'when template has an array in it' do
				let(:template) do
					{
						'key3' => 'b',
						'key2' => {
							'key22' => 'b',
						},
						'key4' => 'b',
						'key' => [{
							'key01' => {
								'key001' => 'b',
								'key1' => 'a',
								'key0011' => 'b',
							}
						}],
						'key5' => 'b'
					}
				end

				it 'returns path to that placeholder' do
					expect(subject).to eql(['key', 0, 'key01', 'key1'])
				end
			end

			context 'when template has an array of more elements in it' do
				let(:template) do
					{
						'key3' => 'b',
						'key2' => {
							'key22' => 'b',
						},
						'key4' => 'b',
						'key' => [{}, {
							'key01' => {
								'key001' => 'b',
								'key1' => 'a',
								'key0011' => 'b',
							}
						}],
						'key5' => 'b'
					}
				end

				it 'returns path to that placeholder' do
					expect(subject).to eql(['key', 1, 'key01', 'key1'])
				end
			end

			context 'when template has an array of more elements in it but no placeholder' do
				let(:template) do
					{
						'key3' => 'b',
						'key2' => {
							'key22' => 'b',
						},
						'key4' => 'b',
						'key' => [{}, {
							'key01' => {
								'key001' => 'b',
								'key1' => 'b',
								'key0011' => 'b',
							}
						}],
						'key5' => 'a'
					}
				end

				it 'returns path to that placeholder' do
					expect(subject).to eql(['key5'])
				end
			end
		end
	end
end
