role :app, %w{172.104.119.228}
role :web, %w{172.104.119.228}
role :db,  %w{172.104.119.228}

set :ssh_options, {
  user: "cbdeploy",
  forward_agent: true
 }
