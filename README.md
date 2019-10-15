# README

Created to revise and learn the main concepts of ROR.


# sidekiq - to run sidekiq from terminal 
    gem "sidekiq",'~> 4.0.0'
#create a file hard_worker.rb in app/workers/ and later call the perform_async method 
#to run the batch jobs. 
    class HardWorker
      include Sidekiq::Worker
    
      def perform(name, count)
        # do something
        puts "#{name} is #{count} yrs old"
      end
    end
    HardWorker.perform_in(1.minutes, 'bob', 5)
# in terminal go the folder path
    bundle exec sidekiq
We always need to run sidekiq jobs from terminal even if we need to check 
the jobs on web.
# to check sidekiq in web 
# should have the following code in routes.rb 
    require 'sidekiq/web'
    mount Sidekiq::Web, at: '/sidekiq'
# Gemfile should be modified as. 
    gem 'sinatra', require: false
    gem 'slim'


