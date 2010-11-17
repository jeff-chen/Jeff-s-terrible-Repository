%w(board piece vulpix player game).each do |name|
  require File.dirname(__FILE__) + '/../' + name
end 