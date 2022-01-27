require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_urls
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))

  urls = page.xpath('//*/a[@class="lientxt"]/@href')
  townhall_urls = []
  urls.each do |url|
    townhall_urls.push("https://www.annuaire-des-mairies.com"+url.to_s.slice(1..-1))
  end
  return townhall_urls
end

def get_townhall_email(townhall_urls)
  mailsTab = []

0..(townhall_urls.length).times do |i|
  site = townhall_urls[i]
  page = Nokogiri::HTML(URI.open(site))
  mail = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
  mailsTab.push(mail.text)
  end
  return mailsTab  
end


def perform
  puts get_townhall_email(get_townhall_urls)
end

perform