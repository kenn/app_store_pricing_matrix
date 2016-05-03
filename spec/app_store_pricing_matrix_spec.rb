require 'spec_helper'

describe AppStorePricingMatrix do
  it '#stems' do
    stems = (0..87).to_a + [510, 530, 550, 560, 570, 580, 590]
    expect(AppStorePricingMatrix.stems).to eq stems
  end

  it '#countries' do
    countries = ["US", "CA", "MX", "AU", "NZ", "JP", "CN", "SG", "HK", "TW", "ID", "IN", "RU",
      "TR", "IL", "ZA", "SA", "AE", "GB", "DK", "SE", "CH", "NO", "LU", "MT", "CY", "DE", "FR",
      "AT", "BG", "EE", "SK", "BE", "CZ", "LV", "LT", "NL", "ES", "IT", "SI", "GR", "IE", "PL",
      "PT", "FI", "RO", "HU", "KR"]
    expect(AppStorePricingMatrix.countries).to eq countries
  end

  it '#currencies' do
    currencies = ["USD", "CAD", "MXN", "AUD", "NZD", "JPY", "CNY", "SGD", "HKD", "TWD", "IDR",
      "INR", "RUB", "TRY", "ILS", "ZAR", "SAR", "AED", "GBP", "DKK", "SEK", "CHF", "NOK", "EUR"]
    expect(AppStorePricingMatrix.currencies).to eq currencies
  end

  it '#find_by' do
    price = AppStorePricingMatrix.find_by(tier: 0, country: 'US')
    expect(price.country_code).to eq 'US'
    expect(price.currency_code).to eq 'USD'
    expect(price.retail_price).to eq 0
    expect(price.wholesale_price).to eq 0

    price = AppStorePricingMatrix.find_by(tier: 1, country: 'US')
    expect(price.country_code).to eq 'US'
    expect(price.currency_code).to eq 'USD'
    expect(price.retail_price).to eq 0.99
    expect(price.wholesale_price).to eq 0.7
  end
end
