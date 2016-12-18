require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :sacloudfs do
  desc 'mount sacloudfs'
  task :mount do
    puts 'Hello sacloudfs!'
  end

  desc 'unmount sacloudfs'
  task :umount do
    puts 'Good bye sacloudfs!'
  end
end
