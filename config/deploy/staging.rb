set :stage, :staging
set :rails_env, 'production'
set :deploy_to, "/home/deployerdemo/apps/#{fetch(:application)}"

role :app, %w{deployerdemo@162.243.105.100}
role :web, %w{deployerdemo@162.243.105.100}
role :db,  %w{deployerdemo@162.243.105.100}

server '162.243.105.100', user: 'deployerdemo', roles: %w{web app db}

set :branch, ENV["REVISION"] || ENV["BRANCH_NAME"] || "master"
