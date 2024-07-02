require 'csv'
require 'classifier-reborn'

table = CSV.parse(File.read("train.csv"), headers: true)
data = File.read('language_classifier.dat')
trained_classifier = Marshal.load data


count = 0
table.map do |row|
  puts "#{row['text']}\ncategorized as: #{row['labels']}\tclassifier result: #{trained_classifier.classify row['text']}\n"
  count += 1
  break if count == 100
end
