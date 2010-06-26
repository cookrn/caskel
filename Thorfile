class Monk < Thor
  include Thor::Actions

  desc "test", "Run all tests"
  def test
    verify_config(:test)

    $:.unshift File.join(File.dirname(__FILE__), "test")

    Dir['test/routes/*_tests.rb'].each do |file|
      load file unless file =~ /^-/
    end
  end

  desc "stories", "Run user stories."
  method_option :pdf, :type => :boolean
  def stories
    $:.unshift(Dir.pwd, "test")

    ARGV << "-r"
    ARGV << (options[:pdf] ? "stories-pdf" : "stories")
    ARGV.delete("--pdf")

    Dir["test/stories/*_stories.rb"].each do |file|
      load file
    end
  end

  desc "start ENV", "Start Monk in the supplied environment"
  def start(env = ENV["RACK_ENV"] || "development")
    verify_config(env)
    invoke :cassandra
    exec "env RACK_ENV=#{env} ruby init.rb"
  end

  CASSANDRA_ENV = ENV["RACK_ENV"] || "development"
  #CASSANDRA_CNF = File.expand_path(File.join("config", "cassandra", "#{CASSANDRA_ENV}-storage-conf.xml"), File.dirname(__FILE__))
  CASSANDRA_PID = File.expand_path(File.join("db", "cassandra", "cassandra.pid"), File.dirname(__FILE__))

  desc "cassandra start|stop", "Start the Cassandra Server"
  def cassandra(action = "start")
    case action
    when "start" then cassandra_start
    when "stop"  then cassandra_stop
    else say_status(:error, "Usage: monk cassandra start|stop")
    end
  end

private

  def self.source_root
    File.dirname(__FILE__)
  end

  def verify_config(env)
    if !(File.exists?("config/settings.example.yml") || File.exists?("config/settingsyml"))
      say_status :error, "Configuration files missing in config/"
      exit(1)
    end
  end

  def cassandra_start
    if File.exists?(CASSANDRA_PID)
      say_status :error, "Cassandra is already running"
    else
      result = %x[cassandra -p #{CASSANDRA_PID}]
      if result.include? "Starting up server"
        say_status :success, "Cassandra started"
      else
        say_status :error, "Cassandra failed to start"
        say_status :solution, "Make sure Cassandra is installed correctly. You should be able to start the server by running 'cassandra' from the command line."
        exit(1)
      end
    end
  end

  def cassandra_stop
    if File.exists?(CASSANDRA_PID)
      say_status :success, "Cassandra stopped"
      system "kill #{File.read(CASSANDRA_PID)}"
    end
  end
end
