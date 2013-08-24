set :user, 'apps'
set :application, 'rails-skeleton'
set :domain, "#{application}.rails.wpsrv.net"

# file paths
set :repository,  "https://github.com/afirel/rails-skeleton.git"
set :deploy_to, "/srv/apps/#{application}"

role :app, domain
role :web, domain
role :db, domain, primary: true

require "bundler/capistrano" # To pull in the Bundler Cap task
require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-2.0.0-p0'
set :rvm_type, :user

set :scm, :git
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :branch, (ENV['COMMIT'] || 'master')

require "capistrano/ext/multistage"
set :stages, %w(production staging)
set :default_stage, "staging"

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

namespace :db do
  # setup the database credentials via symlink
  # see http://www.simonecarletti.com/blog/2009/06/capistrano-and-database-yml/
  desc <<-DESC
    [internal] Updates the symlink for database.yml file to the just deployed release.
  DESC
  task :symlink, :roles => [:app] do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

before 'deploy:finalize_update', 'db:symlink', 'bundle:install'
before 'deploy:restart', 'deploy:migrate'
