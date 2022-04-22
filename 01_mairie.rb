require 'nokogiri'
require 'open-uri'

#méthode 1 pour obtenir les emails sur une adresse de page
def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(open(townhall_url))
    email_cities = []
page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |element|
        email_cities << element.text
    end
    return email_cities
end

#méthode 2 récupérer la liste d'URL de chaque ville 
def get_townhall_url(townhall_url)
    page = Nokogiri::HTML(open("https://annuaire-des-mairies.com/val-d-oise.html"))
    url_cities = []
    page.xpath('//a[contains(@href, "95")]').each do |link|
        url_cities  << "https://www.annuaire-des-mairies.com/" + link['href'][1..-1]
    end
    return url_cities
end 

# méthode 3 : récupérer un array de la liste d'email
def final_array_mail
    townhall_url = "https://www.annuaire-des-mairies.com/95/avernes.html"
url_final = get_townhall_url(townhall_url)
final_array = []
url_final.each do |email|
    page = Nokogiri::HTML(URI.open(email))
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
        final_array << email.text
    end
end
return final_array 
end

# methode 4 : récupérer le noms des villes
def get_city_name
    page = Nokogiri::HTML(open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
    city_name = []
    page.xpath('//a[@class="lientxt"]').each do |element|
        city_name << element.text
    end
    return city_name
end 

# creations de petit hash ville => email
def key_value(key, value)
    return {key => value}
    end
    
# méthode pour push les hash dans un array
def scraper_name_email
email = final_array_mail
city_name = get_city_name
array_mail_name = []
city_name.each.with_index {| key, position| array_mail_name  << key_value(key, email[position])}
return array_mail_name
end

puts scraper_name_email
