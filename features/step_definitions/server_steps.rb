begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end 

Given /^I have a Server$/i do
  $server = Server.new
end


When /^I start my Server$/i do
  $server.start
end

Then /^My server should be named (\w+)$/i do |name|
  $server.name.should == name
end