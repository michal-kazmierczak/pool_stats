require './app'

Dir.glob('./{app/*,api}/*.rb').each { |file| require file }

run Rack::Cascade.new [Home]