require_relative '../lib/00_crypto'

describe "fetch somes currencencies" do
    it "should return name of crypto currencies" do
        expect(scrapper_currency).not_to be_nil
    end
end 