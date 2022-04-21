require 'nokogiri'
require 'open-uri'


def get_cities_mail(url)
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
    email_cities = []
page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |element|
        email_cities << element.text
    end
    return email_cities
end

def get_city_url
    page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
    url_cities = []
end 
