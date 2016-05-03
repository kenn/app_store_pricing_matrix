require 'json'
require 'pathname'

class AppStorePricingMatrix
  class << self
    def tiers
      @tiers ||= begin
        path = Pathname.new(__FILE__).dirname.join('input', 'pricing_matrix.json')
        JSON.parse(File.read(path))['data']['pricingTiers'].map{|i| Tier.new(i) }
      end
    end

    def stems
      tiers.map(&:stem)
    end

    def countries
      tiers.map{|tier| tier.prices.map(&:country_code) }.flatten.uniq
    end

    def currencies
      tiers.map{|tier| tier.prices.map(&:currency_code) }.flatten.uniq
    end

    def find_by(tier: nil, country: nil)
      tiers.find{|i| i.stem == tier }.prices.find{|price| price.country_code == country }
    end
  end

  class Tier
    attr_accessor :stem, :name, :prices

    def initialize(hash)
      @stem   = Integer(hash['tierStem'])
      @name   = hash['tierName']
      @prices = hash['pricingInfo'].map{|i| Price.new(i) }
    end

    def inspect
      string = "#<#{self.class.name}:#{self.object_id} "
      fields = instance_variables.map do |var|
        value = if var == :@prices
          "[...]"
        else
          instance_variable_get(var).inspect
        end
        "#{var}=#{value}"
      end
      string << fields.join(", ") << ">"
    end
  end

  class Price
    attr_accessor :country, :country_code, :currency_symbol, :currency_code,
      :wholesale_price, :retail_price, :formatted_retail_price, :formatted_wholesale_price

    def initialize(hash)
      @country          = hash['country']
      @country_code     = hash['countryCode']
      @currency_symbol  = hash['currencySymbol']
      @currency_code    = hash['currencyCode']
      @wholesale_price  = hash['wholesalePrice']
      @retail_price     = hash['retailPrice']
      @formatted_retail_price     = hash['fRetailPrice']
      @formatted_wholesale_price  = hash['fWholesalePrice']
    end
  end
end
