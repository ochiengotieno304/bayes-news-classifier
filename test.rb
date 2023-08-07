require 'csv'
require 'classifier-reborn'

table = CSV.parse(File.read('NewsCategorizer.csv'), headers: true)

# This is now saved to a file, and you can safely restart the application
data = File.read('classifier.dat')
trained_classifier = Marshal.load data

table.map do |item|
  puts "#{item['headline']}\ncategorized as: #{item['category']}\tclassifier result: #{trained_classifier.classify item['short_description']}\n"
end
