Dotenv.load

###
# Compass
###

activate :directory_indexes

activate :s3_redirect do |config|
  config.bucket = 'makersquare-website'
  config.region                = 'us-east-1'
  config.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  config.after_build           = false
end

###
# List all of your redirects here.
#
# Usage:
#   redirect '/path', 'http://myurl.co'
#   Any time you make a change to the redirects
#     run `middleman s3_redirect` for the changes to take effect.
#   The changes will not show on localhost - only on the real site
#
#   NOTE: These changes effect the real site. Be careful in use.
###

	redirect '/mentorship', "https://dl.dropboxusercontent.com/u/10523929/MakerSquare%20-%20Mentorship.pdf"
	redirect '/interview', "http://meetme.so/makersquareinterview"
  redirect '/amazon', "http://www.amazon.com"
  redirect '/careerday', "http://makersquare.eventbrite.com"
	redirect '/demos', "https://www.eventbrite.com/event/8434611149"
	redirect '/secondary', "http://themakersquare.wufoo.com/forms/mks-secondary-application/"
	redirect '/primary', "http://themakersquare.wufoo.com/forms/makersquare-primary-application/"
	redirect '/finalinterview', "https://www.google.com/calendar/selfsched?sstoken=UUoyRXZkVi13b3RufGRlZmF1bHR8M2VmMzdhMGFjOTRmMjhhMGVhN2QxMTJkOTk3YzU4ZjM"
	redirect '/cfapprentices', "https://themakersquare.wufoo.com/forms/makersquare-apprentices-cf-companies"
	redirect '/casual', "https://www.google.com/calendar/selfsched?sstoken=UUVnZmJ0LW5yN2RTfGRlZmF1bHR8NjFlYzAzN2NjMTZlM2EwMTRlM2JmM2Q3NmY0MmJkOTg"
	redirect '/workshop', "http://themakersquare.wufoo.com/forms/lead-a-workshop-at-makersquare"
	redirect '/event', "https://themakersquare.wufoo.com/forms/host-an-event-at-makersquare"


# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
sprockets.import_asset 'bootstrap'

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Favicon Generator using middleman-favicon-maker
  activate :favicon_maker

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  activate :minify_html

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :s3_sync do |sync|
  sync.bucket = 'makersquare-website'
  sync.region = 'us-east-1'
  sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  sync.prefer_gzip = true
end

activate :cloudfront do |cf|
  cf.access_key_id = ENV['AWS_ACCESS_KEY_ID']
  cf.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  cf.distribution_id = ENV['CLOUDFRONT_DISTRIBUTION_ID']
  # cf.filter = /\.html$/i  # default is /.*/
  # cf.after_build = false  # default is false
end

