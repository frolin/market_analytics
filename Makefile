deploy: git_pull_and_restart_app

git_pull_and_restart_app:
	git pull
	docker-compose -f docker-compose.prod.yml exec worker sidekiq restart
	docker-compose -f docker-compose.prod.yml exec app rails db:migrate
	docker-compose -f docker-compose.prod.yml exec app puma restart
