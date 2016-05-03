App Store Pricing Matrix
========================

[![Build Status](https://secure.travis-ci.org/kenn/app_store_pricing_matrix.png)](http://travis-ci.org/kenn/app_store_pricing_matrix)

A simple module that holds currencies and prices from the Apple's iOS App Store.

Install
-------

    gem install app_store_pricing_matrix

Changelog
---------

v3.0.0 (May 2, 2016)

* Complete overhaul. Now we use the JSON data fetched from Apple's hidden API.

v2.1.0 (October 26, 2012)

* Based on v14.
* Added RUB, TRY, INR, IDR, ILS, ZAR, SAR and AED

v2.0.0 (July 18, 2012)

* Based on v13.
* Added SGD, HKD and TWD.
* `CURRENCY_MAP` and `REVERSE_CURRENCY_MAP` are removed. They are all self-referential now.
* `CUSTOMER_CURRENCIES` and `DEVELOPER_CURRENCIES` are removed. Use `CURRENCIES` instead.

Usage
-----

```ruby
price = AppStorePricingMatrix.find_by(tier: 1, country: 'US')

price.country                     # => "United States"
price.country_code                # => "US"
price.currency_symbol             # => "$"
price.currency_code               # => "USD"
price.wholesale_price             # => 0.7
price.retail_price                # => 0.99
price.formatted_retail_price      # => "$0.99"
price.formatted_wholesale_price   # => "$0.70"
```

```ruby
AppStorePricingMatrix.stems
# => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 510, 530, 550, 560, 570, 580, 590]

AppStorePricingMatrix.countries
# => ["US", "CA", "MX", "AU", "NZ", "JP", "CN", "SG", "HK", "TW", "ID", "IN", "RU", "TR", "IL", "ZA", "SA", "AE", "GB", "DK", "SE", "CH", "NO", "LU", "MT", "CY", "DE", "FR", "AT", "BG", "EE", "SK", "BE", "CZ", "LV", "LT", "NL", "ES", "IT", "SI", "GR", "IE", "PL", "PT", "FI", "RO", "HU", "KR"]

AppStorePricingMatrix.currencies
# => ["USD", "CAD", "MXN", "AUD", "NZD", "JPY", "CNY", "SGD", "HKD", "TWD", "IDR", "INR", "RUB", "TRY", "ILS", "ZAR", "SAR", "AED", "GBP", "DKK", "SEK", "CHF", "NOK", "EUR"]
```

Updating the price
------------------

The pricing matrix JSON is taken from Apple's hidden API at the following URL.

```
https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/ra/apps/#{AppStoreID}/pricing/matrix
```

The URL is accessible when you are logged in to iTunes Connect with your browser.

When you need to update the pricing matrix,

1. Login to iTunes Connect with your developer account.
1. Run `rake aspm:open` and enter any App Store ID that you own.
1. Your default browser will launch and load the JSON. Copy the entire content and paste into `input/pricing_matrix.json`.
1. Run `rake` to check if anything is broken.
1. Send a pull request with updated `input/pricing_matrix.json`.
