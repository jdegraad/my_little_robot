require 'rspec/core/rake_task'

task default: :spec

('01'..'21').each do |num|
  desc "run test suite #{num} of 21"
  RSpec::Core::RakeTask.new("spec:#{num}") do |task|
    task.pattern = "spec/#{num}_*.rb"
    task.rspec_opts = [ '--format documentation', "--color" ]
  end
end

desc "Run all tests"
RSpec::Core::RakeTask.new do |task|
  task.pattern = "spec/*.rb"
  task.rspec_opts = [ '--format documentation', "--color" ]
end
