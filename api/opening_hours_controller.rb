class OpeningHoursController < App
  get '/opening_hours' do
    OpeningHours.all.to_json
  end
end