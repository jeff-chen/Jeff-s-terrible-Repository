begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 

Given /^I have a box of vulpixes$/i do
  $box = []
end

When /^I have a Vulpix$/i do
  $box << Vulpix.new
end

When /^I have a Vulpix with (\d+) Hit Points$/i do |num|
  $box << Vulpix.new("", num)
end
When /^I have (\d+) Vulpixes$/i do |num|
  num.to_i.times do |i|
    $box << Vulpix.new
  end
end

Then /^I should see no Eyes$/i do
  sum = 0
  $box.each{|b| sum += b.hp}
  sum.should == 0
end

Then /^My box should have (\d+) Vulpixes$/i do |num|
  $box.size.should == num.to_i
end

Then /^I should see (\d+) Hit Points$/i do |num|
  sum = 0
  $box.each{|b| sum += b.hp.to_i}
  sum.should == num.to_i
end