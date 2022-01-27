require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_id_urls
  page = Nokogiri::HTML(URI.open('https://www2.assemblee-nationale.fr/deputes/liste/tableau'))
  
  urls = page.xpath('//*[@class="deputes"]/tbody//*/a/@href')
  id_urls = []
  urls.each do |url|
    id_urls.push("https://www2.assemblee-nationale.fr"+url)
  end
  return id_urls
end

def get_id_datas(id_urls)
  datasTab = []
  output = []

0..(id_urls.length).times do |i|
  card = id_urls[i]
  page = Nokogiri::HTML(URI.open(card))

  mail = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
  fullname = mail.text.split("@")[0]
    firstName = fullname.split(".")[0]
    # puts firstName
    lastName = fullname.split(".")[1]
    # puts lastName

  end
  output.push(h)
  #return datasTab  
end

def perform
  get_id_datas(get_id_urls)
end

perform