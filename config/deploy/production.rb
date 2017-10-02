role :app, %w{139.162.112.159}
role :web, %w{139.162.112.159}
role :db,  %w{139.162.112.159}

set :ssh_options, {
  user: "deploy",
  forward_agent: true
 }
