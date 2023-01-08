deploy: git_pull_and_restart_app

git_pull_and_restart_app:
    git pull
    docker-compose -f docker-compose.prod.yml restart app worker
