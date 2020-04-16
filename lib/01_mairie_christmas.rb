require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(open("#{townhall_url}"))

	mail = page.xpath("//div/main/section[2]/div/table/tbody/tr[4]/td[2]")
	puts mail.text
end


def get_townhall_urls()
	array_link = []
	page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

	link = page.xpath('//a[contains(@href, "95")]').each do |link|
		array_link << link['href']
	end

	array_link.each do |lien|
		get_townhall_email("https://www.annuaire-des-mairies.com/#{lien}")
	end

end

