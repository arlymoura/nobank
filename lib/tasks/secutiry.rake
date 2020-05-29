namespace :security do
  desc 'Rails Best Practices'
  task :rbp => :environment do
    path = File.expand_path('../..', __dir__)
    sh "rails_best_practices #{path}"
  end

  desc 'Static analysis vulnerability scanner'
  task :brakeman, [:output_files] => :environment do |_t, args|
    require 'brakeman'

    files = args[:output_files].split(' ') if args[:output_files]
    Brakeman.run app_path: '.',
                 output_files: files,
                 print_report: true,
                 exit_on_warn: true
  end

  desc 'Check Gemfile.lock for insecure dependencies'
  task :gems => :environment do
    sh 'bundle-audit update'
    sh 'bundle-audit check'
  end
end