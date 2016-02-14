class App < Sinatra::Base
  before do
    content_type :json
  end
end