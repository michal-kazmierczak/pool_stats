require "sinatra/base"
require "sinatra/activerecord"
require "pry"
require "slack-notifier"
begin
  AppConfig = YAML.load_file("./config/secrets.yml")[ENV["RACK_ENV"] || "development"]
rescue Errno::ENOENT
  fail Errno::ENOENT, "missing config/secrets.yml file"
end