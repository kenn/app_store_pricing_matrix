require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module ExampleMethods
  def spec_meat(file, currency)
    context "Currency: #{currency}" do
      it "should have currency table" do
        File.exists?(file).should == true
      end

      File.open(file) do |text|
        lines = text.readlines

        it "should have 0 to 85 tiers" do
          lines.size.should be(86)
        end

        it "should verify format of table content" do
          lines.each_with_index do |line,i|
            line.should match(/^\d+(?:\.\d\d)?\n?$/), "Error while reading \"#{File.basename(file)}\", line:#{i+1}"
          end
        end
      end
    end
  end
end
include ExampleMethods

describe "AppStorePricingMatrix" do
  
  context "Customer Currencies" do
    AppStorePricingMatrix::CUSTOMER_CURRENCIES.each do |currency|
      file = File.expand_path(File.dirname(__FILE__) + "/../lib/prices/#{currency.downcase}")
      spec_meat(file, currency)
    end
  end
  
  context "Developer Proceeds" do
    AppStorePricingMatrix::DEVELOPER_CURRENCIES.each do |currency|
      file = File.expand_path(File.dirname(__FILE__) + "/../lib/prices/#{currency.downcase}_pro")
      spec_meat(file, currency)
    end
  end
  
  context "Currency Mapping" do
    it "should return the given currency code if it is a valid customer currency" do
      AppStorePricingMatrix::CUSTOMER_CURRENCIES.each do |currency|
        AppStorePricingMatrix.customer_currency_for_currency_code(currency).should == currency
      end
    end
    
    it "should return EUR for any currency codes that operate the store in Euros" do
      AppStorePricingMatrix::EURO_CURRENCIES.each do |currency|
        AppStorePricingMatrix.customer_currency_for_currency_code(currency).should == "EUR"
      end
    end
    
    it "should return USD for any unknown currency code" do
      AppStorePricingMatrix.customer_currency_for_currency_code(nil).should == "USD"
      AppStorePricingMatrix.customer_currency_for_currency_code("XXX").should == "USD"
      AppStorePricingMatrix.customer_currency_for_currency_code("-").should == "USD"
    end
    
    it "should accept symbols and lowercase currency codes" do
      AppStorePricingMatrix.customer_currency_for_currency_code(:eur).should == "EUR"
      AppStorePricingMatrix.customer_currency_for_currency_code('usd').should == "USD"
    end
  end
end
