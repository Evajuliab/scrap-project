require 'nokogiri'
require 'open-uri'

def scrapper_currency
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    currencies = []
    page.xpath('//a[@class="cmc-table__column-name--symbol cmc-link"]').each do |element|
        currencies << element.text
    end
    return currencies
end

def scraper_value
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    values = []
    page.xpath('//div[@class="sc-131di3y-0 cLgOOr"]').each do |element|
        values << element.text.delete('$,').to_f
    end
    return values
end

def key_value(key, value)
return {key => value}
end

def scraper_crypto
    currencies = scrapper_currency
    values = scraper_value
    crypto_array = []
    currencies.each.with_index {|devise, position| crypto_array << key_value(devise, values[position])}
    return crypto_array
end

puts scraper_cry


#for i in 0..19
k=currency_symbols[i]
v=currency_prices[i]
crypto_symbols_and_prices << Hash[k,v]
end