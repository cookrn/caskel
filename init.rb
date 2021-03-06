ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require "rubygems"

begin
  require "vendor/dependencies/lib/dependencies"
rescue LoadError
  require "dependencies"
end

require "monk/glue"
require "cassandra"

class Main < Monk::Glue
  set :app_file, __FILE__
  use Rack::Session::Cookie
end

# Connect to cassandra database
#$cassandra = Cassandra.new( monk_settings(:cassandra)[:keyspace] , "#{monk_settings(:cassandra)[:host]}:#{monk_settings(:cassandra)[:port]}" )
$cassandra = Cassandra.new( monk_settings(:cassandra)[:keyspace] )


# Load all application files.
Dir[root_path("app/**/*.rb")].each do |file|
  require file
end

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

Main.run! if Main.run?
