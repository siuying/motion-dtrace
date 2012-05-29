require "bundler/gem_tasks"

desc "Build the gem"
task :gem do
  sh "bundle exec gem build motion-dtrace.gemspec"
  sh "mkdir -p pkg"
  sh "mv *.gem pkg/"
end
