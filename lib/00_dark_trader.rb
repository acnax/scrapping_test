require 'nokogiri'
require 'open-uri'

# https://coinmarketcap.com/all/views/all/


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   


crypto_array = []
value_array = []

page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]/div').each do |crypto|
		crypto_array << crypto.text
end

page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]/a').each do |value|
		value_array << value.text
end

size = crypto_array.size


array_hash = Array.new(size) {Hash.new}

(size).times do |i|
	array_hash[i]["#{crypto_array[i]}"] = value_array[i]
end

 print array_hash








