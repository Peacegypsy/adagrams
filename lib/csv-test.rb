require 'csv'

csv_file = '../assets/dictionary-english.csv'
CSV.read( csv_file, "r").each do |line|
  puts true if line.include? "abase"
end
# CSV.read( csv_file, "r").each do |line|
# dictionary = CSV.read(csv_file)
# puts dictionary.include? "abase"
# puts csv.include? 13829
