lock '3.4.0'

set :application, 'pool_stats'
set :repo_url, 'git@github.com:michal-kazmierczak/pool_stats.git'

set :linked_files, %w(config/unicorn.rb config/database.yml config/secrets.yml)
set :linked_dirs, %w(log tmp/pids)

set :keep_releases, 5
set :rbenv_ruby, File.read('.ruby-version').strip

namespace :db do
  task :migrate do
    on roles(:app) do
      execute "cd #{current_path} && RACK_ENV=#{fetch(:stage)} $HOME/.rbenv/bin/rbenv exec bundle exec rake db:migrate"
    end
  end
end

namespace :unicorn do
  task :restart do
    on roles(:app) do
      execute "/etc/init.d/unicorn_#{fetch(:application)} restart"
    end
  end
end

after "deploy", "db:migrate"
after "deploy", "unicorn:restart"