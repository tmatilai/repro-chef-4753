base = File.expand_path('..', __FILE__)

log_level :debug

# set cache path so we can run chef-solo unprivileged
cache_path File.join(base, 'cache')

# use array
cookbook_path [File.join(base, 'cookbooks')]
