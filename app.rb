require "sinatra/base"
require "sinatra/activerecord"

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  before do
    content_type :json
  end
end