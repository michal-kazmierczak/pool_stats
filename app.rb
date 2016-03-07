require "./config/initializer"

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  Dir.glob('./{app/*,api}/*.rb').each { |file| require file }

  configure :production, :staging do
    enable :logging
    set :show_exceptions, false
  end

  before do
    content_type :json
  end

  error ActiveRecord::UnknownAttributeError do |e|
    halt 422, { message: e.message }.to_json
  end

  error ActiveRecord::RecordNotFound do
    halt 404, { message: "resource not found" }.to_json
  end

  not_found do
    halt 404, { message: "endpoint not found" }.to_json
  end
end