require_relative 'document'
require_relative 'type'

require 'csv'

include Document
include Ota

# - list of ota terms types
# - insert array values into csv
# - csv --> name, ota type
# - determine ota type via text analysis --> normalize text, strip, run index or scan
# - keep track of docs that have no ota terms type

# puts TOSDR_DOCUMENT_NAMES

file_path = 'name_dictionary.csv'
File.delete(file_path) if File.exist?(file_path)

CSV.open("name_dictionary.csv", "w", write_headers: true,
  headers: %w[tosdr_document_name ota_terms_type]) do |csv|
  TOSDR_DOCUMENT_NAMES.each do |name|
    # puts 'DOCUMENT: ' + name
    term_match = false
    ota_term_type = 'no match'
    TERMS_TYPES.each do |key|
      values = TERMS_TYPE_KEY_WORDS[key.to_sym] || []
      # puts 'LOOP: ' + key.to_s + ' -> ' + values.length.to_s
      values.each do |v|
        # puts 'TRY: ' + key.to_s + ' -> ' + v.to_s + ' on ' + name
        matches = name.scan(/#{v}/)
        term_match = matches.length.positive?
        # puts 'term_match: ' + term_match.to_s
        ota_term_type = key if term_match
        # puts 'MATCH: ' + v if term_match
        break if term_match
      end
      break if term_match
    end
    csv << [name, ota_term_type]
  end
end

dictionary = CSV.read('name_dictionary.csv', headers: true, liberal_parsing: true)
no_matches = dictionary.find_all { |row| row['ota_terms_type'] == 'no match' }
puts 'NO MATCHES COUNT: ' + no_matches.count.to_s

file_path = 'no_matches.csv'
File.delete(file_path) if File.exist?(file_path)

CSV.open("no_matches.csv", "w", write_headers: true) do |csv|
  no_matches.each { |row| csv << row }
end
