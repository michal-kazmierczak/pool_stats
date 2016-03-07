server ENV["STAGING_SERVER"], user: ENV["STAGING_USER"], roles: %w(app db web)

set :application, 'pool_stats_staging'