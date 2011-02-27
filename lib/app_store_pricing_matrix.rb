module AppStorePricingMatrix
  CURRENCY_MAP = {
    :usd => [ :usd, :mxn ], # WARNING: MXN is a valid Mexican peso - there's no MXP, apparently.
    :cad => [ :cad ],
    :aud => [ :aud, :nzd ],
    :jpy => [ :jpy ],
    :eur => [ :eur, :dkk, :nok, :sek, :chf ],
    :gbp => [ :gbp ]
  }
  CUSTOMER_CURRENCIES = CURRENCY_MAP.values.flatten.map{|i| i.to_s.upcase }
  DEVELOPER_CURRENCIES = CURRENCY_MAP.keys.map{|i| i.to_s.upcase }

  REVERSE_CURRENCY_MAP = {}.tap do |hash|
    CURRENCY_MAP.keys.each do |key|
      CURRENCY_MAP[key].each do |customer_currency|
        hash[customer_currency.to_s.upcase] = key.to_s.upcase
      end
    end
  end

  CUSTOMER_PRICES = {}.tap do |hash|
    CUSTOMER_CURRENCIES.map do |currency|
      hash[currency] = File.read("#{File.dirname(__FILE__)}/prices/#{currency}").split("\n")
    end
  end

  DEVELOPER_PROCEEDS = {}.tap do |hash|
    DEVELOPER_CURRENCIES.each do |key|
      hash[key] = File.read("#{File.dirname(__FILE__)}/prices/#{key}_pro").split("\n")
    end
  end
end
