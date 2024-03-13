require 'csv'

module Document
  documents_csv = CSV.read('documents.csv', headers: true, liberal_parsing: true)
  col_data = []
  documents_csv.each { |row| col_data << row[1] }
  names_array = col_data.uniq.map { |n| n.downcase.strip }
  TOSDR_DOCUMENT_NAMES = names_array
end
