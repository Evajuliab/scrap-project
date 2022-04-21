require 'nokogiri'
require 'open-uri'
require 'rspec'


# obtenir la liste des devises
def scrapper_currency
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    currencies = []
    page.xpath('//a[@class="cmc-table__column-name--symbol cmc-link"]').each do |element|
        currencies << element.text
    end
    return currencies
end

# obtenir la liste des valeurs
def scraper_value
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    values = []
    page.xpath('//div[@class="sc-131di3y-0 cLgOOr"]').each do |element|
        values << element.text.delete('$,').to_f
    end
    return values
end

#méthode d'affichage devise/valeur en petits hash
def key_value(key, value)
return {key => value}
end

# mettre les hash devise => valeur dans un array
def scraper_crypto
    currencies = scrapper_currency
    values = scraper_value
    crypto_array = []
    currencies.each.with_index {|devise, position| crypto_array << key_value(devise, values[position])}
    return crypto_array
end

puts  scrapper_currency


