require 'nokogiri'
require 'open-uri'

def depute_urls()
  array_link = []
  page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  
  link = page.xpath('//div[@id="deputes-list"]//a[contains(@href, "fiche")]').each do |link|
    array_link << link['href']
  end


 	depute = []
  array_link.take(5).each do |lien|
    depute << get_info("http://www2.assemblee-nationale.fr#{lien}")

  end
  print depute

end

def get_info(depute_url)
	page = Nokogiri::HTML(open("#{depute_url}"))
	hash_depute = {}
	
	first_last_name = page.xpath('//*[@id="haut-contenu-page"]/article/div[2]/h1')
	mail = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a')

	hash_depute["user_name"] = "#{first_last_name.text}"
	hash_depute["email"] = "#{mail.text}"

	hash_depute
end

depute_urls

