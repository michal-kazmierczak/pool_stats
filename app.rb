require "sinatra/base"
require "sinatra/activerecord"
require "pry" if Sinatra::Base.development?

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :logging
    set :show_exceptions, false if production?
  end

  before do
    content_type :json
  end

  error ActiveRecord::UnknownAttributeError do |e|
    halt 422, { message: e.message }.to_json
  end
end