require "sinatra/base"
require "sinatra/activerecord"
require "pry" if Sinatra::Base.development?

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :logging
  end

  before do
    content_type :json
  end
end