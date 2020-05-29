begin
  require 'rspec/core/rake_task'
  Rake::Task[:spec].clear
  RSpec::Core::RakeTask.new(:spec) do |task|
    task.rspec_opts = '--require spec_helper --format Fuubar --color'
  end
end