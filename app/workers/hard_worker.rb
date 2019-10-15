class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    # do something
    if count == 5
      # raise "To understand the concept of retries - count is 5"
      puts "Thats was really hard"
    else
      # raise "To understand the concept of retries - count is 10"
      puts "#{name} is #{count} yrs old"
    end
  end
end

HardWorker.perform_async('bob', 10)
HardWorker.perform_in(1.minutes, 'bob', 10)
HardWorker.perform_in(1.minutes, 'bob', 5)
# HardWorker.perform_at(5.minutes.from_now, 'bob', 5)