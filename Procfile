
web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
release: bundle exec rails db:migrate
worker : bundle exec sidekiq -e production -C config/sidekiq.yml
worker : bundle exec sidekiq -e staging -C config/sidekiq.yml
