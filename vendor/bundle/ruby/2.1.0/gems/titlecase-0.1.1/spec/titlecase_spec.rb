require File.join(File.dirname(__FILE__), *%w[../lib/titlecase.rb])
require "yaml"

describe String do
  File.open(File.join(File.dirname(__FILE__), *%w[examples.yaml])) do |file|
    examples = YAML.load(file)
    examples["should_pass"].each do |e|
      it "should be the expected value (#{e["expect"]})" do
        e["example"].titlecase.should == e["expect"]
      end
    end
  end
  
  # Ensure the self-modifying version works correctly
  it "should self-modify the original value in place" do
    string = 'a complex thing'
    string.titlecase!
    string.should == 'A Complex Thing'
  end
end
