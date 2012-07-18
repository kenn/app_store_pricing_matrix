require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module ExampleMethods
  def spec_meat(file, currency)
    context "Currency: #{currency}" do
      it "should have currency table" do
        File.exists?(file).should == true
      end

      File.open(file) do |text|
        lines = text.readlines

        it "should have 0 to 87 tiers" do
          lines.size.should be(88)
        end

        it "should have 0 for tier 0" do
          ['0', '0.00'].should include lines.first.chomp
        end

        it "should verify format of table content" do
          lines.each_with_index do |line,i|
            line.should match(/^\d+(?:\.\d\d)?\n?$/), "Error while reading \"#{File.basename(file)}\", line:#{i+1}"
          end
        end
        
        it "should have increasing prices" do
          lines.each_with_index do |line,i|
            next if i == 0
            line.to_f.should be > lines[i - 1].to_f 
          end
        end
      end
    end
  end
end
include ExampleMethods

describe "AppStorePricingMatrix" do
  
  context "Customer Currencies" do
    AppStorePricingMatrix::CURRENCIES.each do |currency|
      file = File.expand_path(File.dirname(__FILE__) + "/../lib/prices/#{currency.downcase}")
      spec_meat(file, currency)
    end
  end
  
  context "Developer Proceeds" do
    AppStorePricingMatrix::CURRENCIES.each do |currency|
      file = File.expand_path(File.dirname(__FILE__) + "/../lib/prices/#{currency.downcase}_pro")
      spec_meat(file, currency)
    end
  end
  
  context "Currency Mapping" do
    it "should return the given currency code if it is a valid customer currency" do
      AppStorePricingMatrix::CURRENCIES.each do |currency|
        AppStorePricingMatrix.customer_currency_for(currency).should == currency
      end
    end
    
    it "should return EUR for any currency codes that operate the store in Euros" do
      AppStorePricingMatrix::EURO_CURRENCIES.each do |currency|
        AppStorePricingMatrix.customer_currency_for(currency).should == "EUR"
      end
    end
    
    it "should return nil for any unknown currency code" do
      AppStorePricingMatrix.customer_currency_for(nil).should == nil
      AppStorePricingMatrix.customer_currency_for("XXX").should == nil
      AppStorePricingMatrix.customer_currency_for("-").should == nil
    end
    
    it "should accept symbols and lowercase currency codes" do
      AppStorePricingMatrix.customer_currency_for(:eur).should == "EUR"
      AppStorePricingMatrix.customer_currency_for('usd').should == "USD"
    end
  end
end
