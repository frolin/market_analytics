namespace :composing do
  desc "Build application images"
  task :build do
    on roles(:app) do
      within current_path do
        execute("docker-compose",
                "--project-name=#{fetch(:application)}_#{fetch(:stage)}",
                "-f", "docker-compose.prod.yml",
                "build"
        )
      end
    end
  end

  desc "Take down compose application containers"
  task :down do
    on roles(:app) do
      within current_path do
        execute("docker-compose",
                "--project-name=#{fetch(:application)}_#{fetch(:stage)}",
                "-f", "docker-compose.prod.yml",
                "down"
        )
      end
    end
  end

  namespace :restart do
    desc "Rebuild and restart app container"
    task :app do
      on roles(:app) do
        within current_path do
          execute("docker-compose",
                  "--project-name=#{fetch(:application)}",
                  "-f", "docker-compose.prod.yml",
                  "build", "app"
          )
          execute("docker-compose",
                  "--project-name=#{fetch(:application)}",
                  "-f", "docker-compose.prod.yml",
                  "up", "-d", "--no-deps", "app"
          )
        end
      end
    end
  end

  namespace :database do
    desc "Up database and make sure it's ready"
    task :up do
      on roles(:app) do
        within current_path do
          execute("docker-compose",
                  "--project-name=#{fetch(:application)}",
                  "-f", "docker-compose.prod.yml",
                  "up", "-d", "--no-deps", "db"
          )
        end
      end
      sleep 5
    end

    desc "Create database"
    task :create do
      on roles(:app) do
        within current_path do
          execute("docker-compose",
                  "--project-name=#{fetch(:application)}",
                  "-f", "docker-compose.prod.yml",
                  "run", "--rm", "app", "rake", "db:create"
          )
        end
      end
    end

    desc "Migrate database"
    task :migrate do
      on roles(:app) do
        within current_path do
          execute("docker-compose",
                  "--project-name=#{fetch(:application)}",
                  "-f", "docker-compose.prod.yml",
                  "run", "--rm", "app", "rake", "db:migrate"
          )
        end
      end
    end
  end

  desc "Set telegram webhook database"
  task :telegram_create_webhook do
    on roles(:app) do
      within current_path do
        execute("docker-compose",
                "--project-name=#{fetch(:application)}",
                "-f", "docker-compose.prod.yml",
                "run", "--rm", "app", "rake", "telegram:bot:create_webhook"
        )
      end
    end
  end

  task :telegram_delete_webhook do
    on roles(:app) do
      within current_path do
        execute("docker-compose",
                "--project-name=#{fetch(:application)}",
                "-f", "docker-compose.prod.yml",
                "run", "--rm", "app", "rake", "telegram:bot:delete_webhook"
        )
      end
    end
  end
end