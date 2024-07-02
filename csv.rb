require 'csv'
require 'ostruct'
require 'classifier-reborn'

table = CSV.parse(File.read("train.csv"), headers: true)

language_codes = []

table.each do |row|
  language_codes.push(row["labels"])
end

language_codes = language_codes.uniq

classifier = ClassifierReborn::Bayes.new language_codes

table.each do |row|
  classifier.train row["labels"], row["text"]
end

classifier_snapshot = Marshal.dump classifier

File.open('language_classifier.dat', 'w') { |f| f.write(classifier_snapshot) }