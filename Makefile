start-server:
	rails s -b 0.0.0.0
db-migrate:
	rake db:migrate:reset db:seed
	annotate