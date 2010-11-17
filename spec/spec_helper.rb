%w(piece board vulpix player game bishop pawn rook knight queen king).each do |name|
  require File.dirname(__FILE__) + '/../' + name
end 