set :deploy_to, "/home/#{fetch(:application)}/production"

server 'killer.webinar', user: 'root', roles: %w{web app}, ssh_options: { forward_agent: true }
