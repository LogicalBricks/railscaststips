set :stage, :production

role :app, %w{deployer@104.131.246.184}
role :web, %w{deployer@104.131.246.184}
role :db,  %w{deployer@104.131.246.184}

server '104.131.246.184', user: 'deployer', roles: %w{web app db}

set :branch, ENV["REVISION"] || ENV["BRANCH_NAME"] || "master"
