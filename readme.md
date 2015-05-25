Template generator for nginx.

Assuming the following:
you have the following directory structure on your server:

# for apps

/opt/apps/production/some_app_name
/opt/apps/production/some_app_name/public

/opt/apps/staging/some_app_name
/opt/apps/staging/some_app_name/public

/opt/apps/development/some_app_name
/opt/apps/development/some_app_name/public



# for static websites

/opt/static/some_app_name/public




First edit *variables.rb*

	@hostname='www.some-domain.com'
	@app_name='some_app_name'


then run the following command


	ruby ncg.rb

	
After that, restert your nginx

	service nginx restart
	
	
for static websites, you can use the *static_template*

	erb -r ./variables.rb static_template.erb > /etc/nginx/sites-enabled/www.some-domain.com


** For some reason, beyond my comprehension, local (lower-case) variables within the 'library' *variables.rb* are not accessable within the template.

Constants (UPPERCASE in ruby, e.g. `HOSTNAME` do appear to be available.
Instance variables also work, e.g. `@hostname`
