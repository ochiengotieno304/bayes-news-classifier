require 'classifier-reborn'

data = File.read('classifier.dat')
trained_classifier = Marshal.load data

puts trained_classifier.classify "Kể từ khi Lionel Messi gia nhập Inter Miami tại MLS, những tranh luận bắt đầu nổ ra. Nhiều ý kiến cho rằng Saudi Pro League - giải đấu mà Cristiano Ronaldo đang&nbsp;.."
