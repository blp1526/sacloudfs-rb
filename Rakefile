require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'sacloudfs'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :sacloudfs do
  desc 'mount sacloudfs, need a argument as a mount point'
  task :mount do
    FuseFS.main { |_options| Sacloudfs::Fuse::Dir.new }
  end
end
