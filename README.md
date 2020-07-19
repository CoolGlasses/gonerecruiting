# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


---Database Reset---

Comment out local_env.yml in config directory.
Comment out local_env.yml logic in application.rb
Run db:reset
Run rake db:seed:{scraper file} individually as needed
Run db:dump to get a .sql version of development db once certain reset/seeds worked appropiately.
Upload development_backup to ElephantSQL in Prod.