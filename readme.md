Template generator for nginx.

First edit *variables.rb*

	hostname='www.some-domain.com'
	app_name='some_app_name'


then run the following command
(make sure you got the right filename, I usually use the main hostname as filename.)

	erb -r ./variables.rb app_template.erb > /etc/nginx/sites-enabled/www.some-domain.com
	
Now restert your nginx

	service nginx restart
	
	
for static websites, you can use the *static_template*

	erb -r ./variables.rb static_template.erb > /etc/nginx/sites-enabled/www.some-domain.com