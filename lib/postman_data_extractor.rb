require 'postman_data_extractor/version'
require 'postman_data_extractor/data'
require 'postman_data_extractor/chain'
require 'postman_data_extractor/template'
require 'json'
require 'httparty'

module PostmanDataExtractor
  def self.extract(collection)
    PostmanDataExtractor::Data.extract(collection)
  end
end
