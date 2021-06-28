require 'sinatra'
#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
configure :production, :development do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/api_test_sinatra')

	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			# :host     => db.host,
			:host     => 'localhost',
			# :username => db.user,
			:username => 'postgres',
			# :password => db.password,
			:password => 123,
			# :database => db.path[1..-1],
			:database => 'api_test_sinatra',
			:encoding => 'utf8'
	)
end
