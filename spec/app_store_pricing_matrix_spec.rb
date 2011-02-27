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
end
