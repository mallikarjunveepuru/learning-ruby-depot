# adjust if you are using RVM, remove if you are not
set :rvm_type, :user
set :rvm_ruby_string, 'ruby-2.1.2'
require 'rvm/capistrano'

set :user, 'lkg0dzre'
set :domain, '192.241.219.85'
set :application, "depot.ruby.learning.by.lkg0dzre.com"

# Source code
set :scm, :git
set :repository, "git@github.com:lkg0dzre/learning-ruby-depot.git" 
set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }

# Deployment servers
role :app, domain
role :web, domain
role :db, domain, :primary => true
set :deploy_to, "/srv/#{application}"

# miscellaneous options
set :use_sudo, false
set :normalize_asset_timestamps, false
set :rails_env, :production

