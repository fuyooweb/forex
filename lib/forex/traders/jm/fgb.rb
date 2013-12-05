Forex::Trader.define "FGB" do |t|
  t.base_currency = "JMD"
  t.name          = "First Global Bank"
  t.endpoint      = "http://www.firstglobal-bank.com/"

  t.rates_parser = Proc.new do |doc| # doc is a nokogiri document
    options = {
      currency_code: 0,
      buy_cash: 1,
      buy_draft: 2,
      sell_cash: 3,
      sell_draft: 3,
    }

    table = doc.css("#forex_rates table").first
    Forex::TabularRates.new(table, options).parse_rates
  end
end