# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'killer'
set :repo_url, 'git@github.com:cintrzyk/killer.git'

set :rbenv_custom_path, '/usr/local/rbenv'
set :rbenv_ruby, '2.1.3'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{
  config/database.yml
  config/secrets.yml
  config/unicorn.rb
  config/unicorn_init.sh
  config/nginx.production.conf
}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  %w{start stop restart}.each do |command|
    desc "#{command} unicorn server"
    task command do
      on roles(:app) do
        execute "service unicorn_#{fetch(:application)} #{command}"
      end
    end
  end
  after :finishing, :restart
end
