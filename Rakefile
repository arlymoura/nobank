# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task default: :test

task :rubocop do
  sh "bundle exec rubocop ."
end

desc "Run complete test suite"
task :test do
  Rake::Task["rubocop"].invoke
  Rake::Task["security:rbp"].invoke
  if ENV["CIRCLE_TEST_REPORTS"]
    Rake::Task["spec_ci"].invoke
  else
    Rake::Task["spec"].invoke
  end
  Rake::Task["security:brakeman"].invoke
end

namespace :db do
  desc "Update database with new migrations"
  task :update do
    puts "Updating #{ENV['RAILS_ENV']} database"
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:test:prepare"].invoke
  end

  desc "Reset development database"
  task :nuke do
    sh "bundle exec rails db:migrate:reset db:seed"
    sh "bundle exec rails db:migrate:reset RAILS_ENV=test"
  end
end