namespace :assets do
  task :precompile do
    puts `bundle exec middleman build`
  end
end

desc 'Build and deploy the site, and invalidate the CloudFront cache.'
task :deploy do
  puts `bundle exec middleman build`
  puts `bundle exec middleman s3_sync`
  puts `bundle exec middleman invalidate`
end
