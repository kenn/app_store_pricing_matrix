module AppStorePricingMatrix
  CURRENCIES = %w(USD CAD MXN AUD NZD JPY EUR DKK SEK CHF NOK GBP CNY SGD HKD TWD RUB TRY INR IDR ILS ZAR SAR AED).freeze
  EURO_CURRENCIES = %w(BGN CZK EEK HUF LVL LTL MTL PLN RON).freeze

  CUSTOMER_PRICES = {}.tap do |hash|
    CURRENCIES.each do |currency|
      hash[currency] = File.read("#{File.dirname(__FILE__)}/prices/#{currency.downcase}").split("\n").freeze
    end
  end.freeze

  DEVELOPER_PROCEEDS = {}.tap do |hash|
    CURRENCIES.each do |currency|
      hash[currency] = File.read("#{File.dirname(__FILE__)}/prices/#{currency.downcase}_pro").split("\n").freeze
    end
  end.freeze
  
  def self.customer_currency_for(currency_code)
    code = currency_code.to_s.upcase
    return code   if CURRENCIES.include? code
    return 'EUR'  if EURO_CURRENCIES.include? code
    return nil
  end
end
