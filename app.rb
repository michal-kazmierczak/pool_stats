require "sinatra/base"
require "sinatra/activerecord"
require "pry" if Sinatra::Base.development?

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :logging
    file = File.new("#{settings.root}/log/#{settings.environment}.log", 'a+')
    file.sync = true
    use Rack::CommonLogger, file
  end

  before do
    content_type :json
  end
end