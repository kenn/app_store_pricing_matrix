require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "AppStorePricingMatrix" do
  it "should have 0 to 85 tiers each" do
    Dir.glob(File.dirname(__FILE__) + '/../lib/prices/*').each do |file|
      File.open(file) do |text|
        text.readlines.size.should == 86
      end
    end
  end
end
