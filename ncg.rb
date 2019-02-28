require 'erb'
require './variables'

server_template 	= File.read('./server_template.erb')
upstream_template 	= File.read("./upstream_#{@rails_server}_template.erb")

nginx_server_conf_path		= "/etc/nginx/sites-enabled/#{@hostname}"
nginx_upstream_conf_path	= "/etc/nginx/sites-enabled/#{@app_name}.upstream"

renderer = ERB.new(server_template)
output = renderer.result(binding)
File.open(nginx_server_conf_path, 'w') {|f| f.write(output) }

renderer = ERB.new(upstream_template)
output = renderer.result(binding)
File.open(nginx_upstream_conf_path, 'w') {|f| f.write(output) }
