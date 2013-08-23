set :user, 'apps'
set :domain, 'skeleton.rails.wpsrv.net'
set :application, 'rails-skeleton'

# file paths
set :repository,  "https://github.com/afirel/rails-skeleton.git"
set :deploy_to, "/srv/apps/#{application}"

role :app, domain

require "bundler/capistrano" # To pull in the Bundler Cap task
require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-2.0.0-p247'
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
