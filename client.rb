
this_dir = File.expand_path(File.dirname(__FILE__))
lib_dir = File.join(this_dir, 'pr-ruby-out')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
lib_dir = File.join(this_dir, 'pr-ruby-gout')
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

require 'grpc'
require 'service_services_pb'

def main
  user = ARGV.size > 0 ?  ARGV[0] : 'world'
  hostname = ARGV.size > 1 ?  ARGV[1] : 'php:9001'
  stub = Service::Echo::Stub.new(hostname, :this_channel_is_insecure)
  begin
    message = stub.ping(Service::Message.new(msg: user)).msg
    p "Greeting: #{message}"
  rescue GRPC::BadStatus => e
    abort "ERROR: #{e.message}"
  end
end

main
