class HomeController < App
  get '/' do
    Entry.all.to_json
  end

  get '/today' do
    today = DateTime.current.wday
    Entry.where(day_of_week: today).to_json
  end

  get '/on/:day_of_week' do
    day_of_week_id = Date::DAYNAMES.index(params["day_of_week"].capitalize)
    halt 422, { message: 'Unknown day of week' }.to_json if day_of_week_id.nil?

    Entry.where(day_of_week: day_of_week_id).to_json
  end

  post '/' do
    entry = Entry.new(params)

    if entry.save
      SlackNotificator.new(
        "New entry! *#{entry.swimmers}* swimmers on *#{entry.date}* from device: _#{entry.device_id || 'unknown'}_."
      ).call
      entry.to_json
    else
      halt 422, entry.errors.to_json
    end
  end

  delete '/:id' do
    if AppConfig["delete_tokens"].exclude?(params["token"])
      halt 403, { message: "Wrong token" }.to_json
    end

    entry = Entry.find(params["id"])
    entry.destroy.to_json
  end
end