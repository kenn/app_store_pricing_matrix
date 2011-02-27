module AppStorePricingMatrix
  CURRENCY_MAP = {
    :usd => [ :usd, :mxn ].freeze, # WARNING: MXN is a valid Mexican peso - there's no MXP, apparently.
    :cad => [ :cad ].freeze,
    :aud => [ :aud, :nzd ].freeze,
    :jpy => [ :jpy ].freeze,
    :eur => [ :eur, :dkk, :nok, :sek, :chf ].freeze,
    :gbp => [ :gbp ].freeze
  }.freeze
  CUSTOMER_CURRENCIES = CURRENCY_MAP.values.flatten.map{|i| i.to_s.upcase }.freeze
  DEVELOPER_CURRENCIES = CURRENCY_MAP.keys.map{|i| i.to_s.upcase }.freeze

  REVERSE_CURRENCY_MAP = {}.tap do |hash|
    CURRENCY_MAP.keys.each do |key|
      CURRENCY_MAP[key].each do |customer_currency|
        hash[customer_currency.to_s.upcase] = key.to_s.upcase
      end
    end
  end.freeze

  CUSTOMER_PRICES = {}.tap do |hash|
    CUSTOMER_CURRENCIES.map do |currency|
      hash[currency] = File.read("#{File.dirname(__FILE__)}/prices/#{currency.downcase}").split("\n").freeze
    end
  end.freeze

  DEVELOPER_PROCEEDS = {}.tap do |hash|
    DEVELOPER_CURRENCIES.each do |key|
      hash[key] = File.read("#{File.dirname(__FILE__)}/prices/#{key.downcase}_pro").split("\n").freeze
    end
  end.freeze
end
