require 'eventmachine'
require 'rubygems'
require 'em-websocket'
#puts 'hullo'


class DataBuffer < EM::Protocols::LineAndTextProtocol
  def initialize
    puts "init'ing new instance of #{self.class.to_s}"
    @line_ctr = 0
    @databuf = []
  end

  def receive_data(data)
    @databuf << data
    @line_ctr += 1
    if data == ".\r\n" || @line_ctr == 10
      if data == ".\r\n"
        @databuf.pop
      end
      send_data(@databuf.to_s)
      reset_databuf()
    end
  end

  private
  def reset_databuf
    @line_ctr = 0
    @databuf = []
  end
end

module MyServer
  def receive_data(data)
    puts data.inspect
  end
  def post_init
    puts 'client connected'
    send_object("Lolcats!")
  end
  
  def send_object(object)
    puts 'lol!'
  end
end

#EventMachine::run {
#  EventMachine::start_server "127.0.0.1", 3737, DataBuffer
#  puts "Running server on 3737"
#}