#! /bin/sh

rm docker/db/.keep
rm src/.keep
cp docker/ruby/Gemfile* src/

docker-compose build
docker-compose run ruby rails new . --force --database=postgresql --skip-bundle
docker-compose build

# vi src/config/database.yml
# --------------------
# host: db
# username: postgres
# password:
# --------------------

# docker-compose run ruby rake db:setup
