class Home < App
  get '/' do
    Entry.all.to_json
  end
end