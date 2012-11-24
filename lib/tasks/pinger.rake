require 'pinger.rb'
task :ping => :environment do 
  Pinger.perform
end
