role :app, %w{139.162.112.159}
role :web, %w{139.162.112.159}
role :db,  %w{139.162.112.159}

set :branch, ENV["BRANCH"] || `git rev-parse --abbrev-ref HEAD`.chomp
set :rails_env, "production"

set :ssh_options, {
  user: "deploy",
  forward_agent: true
 }
