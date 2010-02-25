load 'deploy' if respond_to?(:namespace) # cap2 differentiator
require 'track_deploy'

set :use_sudo, false
set :group_writable, false     # Shared environment
set :keep_releases, 4      # 4 Releases should be enough

set :user, "arid"
set :application, "default"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
default_run_options[:pty] = true
set :repository, "git@github.com:hilkeros/Arid.git"
set :scm, :git
set :ssh_options, { :forward_agent => true }

# to init and update submodules at checkout

set :deploy_via, :remote_cache
set :git_enable_submodules,1
set :git_shallow_clone, 1

set :branch, "master"

set :deploy_to, "/home/#{user}/apps/#{application}"

server "pro-004.openminds.be", :app, :web, :db, :primary => true


# passenger config
namespace :passenger do
    desc "Restart the web server"
    task :restart, :roles => :app do
        run "touch  #{current_release}/tmp/restart.txt"
    end

    [:start, :stop].each do |t|
        desc "#{t} task is a no-op with passenger"
        task t, :roles => :app do ; end
    end
end


namespace :deploy do
    desc "Restart your application"
    task :restart do
        passenger::restart
    end

    desc "Start your application"
    task :start do
        passenger::start
    end

    desc "Stop your application"
    task :stop do
        passenger::stop
    end
end

# database.yml - We houden onze database.yml nooit versioned bij
namespace :dbconfig do
    desc "Create database.yml in shared/config"
    task :copy_database_config do
        run "mkdir -p #{shared_path}/config"
        put File.read('config/database.yml'), "#{shared_path}/config/database.yml"
    end

    desc "Link in the production database"
    task :link do
        run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
        run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
        
		run "rm -rf #{latest_release}/public/assets && ln -nfs #{shared_path}/assets #{latest_release}/public/assets"
    end
end

desc "After Code Update"
task :after_update_code do
    dbconfig::link
end

desc "After setup"
task :after_setup do
    dbconfig::copy_database_config
end

desc "Keep only 4 releases"
task :after_deploy do
  deploy::cleanup
end