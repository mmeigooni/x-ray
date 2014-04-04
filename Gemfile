# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
source 'http://rubygems.org'

gem "middleman", "~>3.1.4"
gem "middleman-s3_sync", "~> 3.0.11"
gem 'middleman-s3_redirect'
gem "middleman-cloudfront"

gem "middleman-minify-html"

# Live-reloading plugin
gem "middleman-livereload", "~> 3.1.0"

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]

gem "dotenv"

# For creating various favicons
gem "middleman-favicon-maker", "~> 3.2"

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end
