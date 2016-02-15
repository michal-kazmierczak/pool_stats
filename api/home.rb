class Home < App
  get '/' do
    Entry.all.to_json
  end

  post '/' do
    entry = Entry.new(params)

    if entry.save
      entry.to_json
    else
      halt 422, entry.errors.to_json
    end
  end
end