require 'json'
require 'ostruct'
require 'classifier-reborn'

categories = []

File.readlines('./News_Category_Dataset_v3.json').each do |line|
  news_item = JSON.parse(line, object_class: OpenStruct)
  categories.push(news_item.category)
end

news_categories = categories.uniq

classifier = ClassifierReborn::Bayes.new news_categories

File.readlines('./News_Category_Dataset_v3.json').each do |line|
  news_item = JSON.parse(line, object_class: OpenStruct)
  classifier.train news_item.category, news_item.short_description
end

classifier_snapshot = Marshal.dump classifier

File.open('classifier.dat', 'w') { |f| f.write(classifier_snapshot) }
