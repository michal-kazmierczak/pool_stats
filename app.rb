require "./config/initializer"

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  Dir.glob('./{app/*,api}/*.rb').each { |file| require file }

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