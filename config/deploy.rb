lock '3.4.0'

set :application, 'pool_stats'
set :repo_url, 'git@github.com:michal-kazmierczak/pool_stats.git'

set :linked_files, %w(config/unicorn.rb config/database.yml)
set :linked_dirs, %w(log tmp/pids)

set :keep_releases, 5
set :rbenv_ruby, File.read('.ruby-version').strip

namespace :unicorn do
  task :restart do
    on roles(:app) do
      execute "/etc/init.d/unicorn_pool_stats restart"
    end
  end
end

after "deploy", "unicorn:restart"