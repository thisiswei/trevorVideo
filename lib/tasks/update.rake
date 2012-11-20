require 'updater.rb'
task :update => :environment do
  Updater.perform
end
