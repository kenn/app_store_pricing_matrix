App Store Pricing Matrix
========================

A simple module that holds currencies and prices from the Apple's iOS App Store.

Install
-------

    gem install app_store_pricing_matrix

Usage
-----

Suppose you find a device locale by `NSLocale` on an iOS device.

```objc
NSString* currency = [[NSLocale currentLocale] objectForKey:NSLocaleCurrencyCode];
```

That will give you the currency string like `USD` or `EUR`, and this library expects them as a key.

Some constants, useful for validation:

```ruby
AppStorePricingMatrix::CUSTOMER_CURRENCIES
 => ["USD", "CAD", "MXN", "AUD", "NZD", "JPY", "EUR", "DKK", "SEK", "CHF", "NOK", "GBP", "CNY"]

AppStorePricingMatrix::DEVELOPER_CURRENCIES
 => ["USD", "CAD", "MXN", "AUD", "NZD", "JPY", "EUR", "CHF", "NOK", "GBP", "CNY"]
```

To retrieve a customer price, query with the currency and the tier number:

```ruby
AppStorePricingMatrix::CUSTOMER_PRICES['USD'][1]
 => "0.99"

AppStorePricingMatrix::CUSTOMER_PRICES['JPY'][1]
 => "85"
```

For developer proceeds:

```ruby
AppStorePricingMatrix::DEVELOPER_PROCEEDS['GBP'][30]
 => "12.78"
```

To retrieve a developer currency from a given customer currency:

```ruby
AppStorePricingMatrix::REVERSE_CURRENCY_MAP['SEK']
 => "EUR"

AppStorePricingMatrix::REVERSE_CURRENCY_MAP['DKK']
 => "EUR"
```
