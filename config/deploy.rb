# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'railscaststips'
set :scm, "git"
set :repo_url, "git@github.com:LogicalBricks/railscaststips.git"
set :deploy_to, "/home/deployer/apps/#{fetch(:application)}"

set :ssh_options, {
  forward_agent: true
}

set :log_level, :debug
set :linked_files, %w{config/database.yml config/secrets.yml config/github.yml config/twitter.yml}
set :linked_dirs, %w{bin log tmp vendor/bundle public/system public/uploads}

SSHKit.config.command_map[:rake]  = "bundle exec rake"
SSHKit.config.command_map[:rails] = "bundle exec rails"

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end

  after :finishing, 'deploy:cleanup'
end
