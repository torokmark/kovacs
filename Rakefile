require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)
version = Kovacs::VERSION

task :default => :spec

task :build do
    system "gem build kovacs.gemspec"
end

task :install do
  system "gem install kovacs-#{ version }.gem"
end

task :exec do
  system "./bin/kovacs"
end

task :full => [:spec, :build, :install, :exec]

