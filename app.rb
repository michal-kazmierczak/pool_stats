require 'sinatra/base'
require 'sinatra/activerecord'


class App < Sinatra::Base
  before do
    content_type :json
  end

  get '/' do
    [].to_json
  end
end