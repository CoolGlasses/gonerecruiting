require "nokogiri"
require "open-uri"
require "pry"

doc = Nokogiri::HTML(open('http://www.2bcentral.com/index.php?pid=0.31.245.12.320'))
binding.pry