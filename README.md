# Repro for [CHEF-4753](https://tickets.opscode.com/browse/CHEF-4753)

## Usage
```
git clone https://github.com/tmatilai/repro-chef-4753.git
cd repro-chef-4753
bundle
# OK
bundle exec chef-solo -c solo.rb -j dna.json
# Fail
bundle exec chef-solo -c solo.rb -j dna.json -E foo
```

## Error Output

```
[2013-11-12T23:49:52-03:00] INFO: Forking chef instance to converge...
[2013-11-12T23:49:52-03:00] DEBUG: Fork successful. Waiting for new chef pid: 33514
[2013-11-12T23:49:55-03:00] FATAL: Chef::Exceptions::ChildConvergeError: Chef run process exited unsuccessfully (exit code 1)
[2013-11-12T23:50:21-03:00] INFO: Forking chef instance to converge...
[2013-11-12T23:50:21-03:00] DEBUG: Forked instance now converging
[2013-11-12T23:50:21-03:00] INFO: *** Chef 11.8.0 ***
[2013-11-12T23:50:21-03:00] INFO: Chef-client pid: 33604
[2013-11-12T23:50:23-03:00] DEBUG: Building node object for malbec.local
[2013-11-12T23:50:23-03:00] DEBUG: Extracting run list from JSON attributes provided on command line
[2013-11-12T23:50:23-03:00] INFO: Setting the run_list to "recipe[test]" from JSON
[2013-11-12T23:50:23-03:00] DEBUG: Applying attributes from json file
[2013-11-12T23:50:23-03:00] DEBUG: Platform is mac_os_x version 10.8.5
[2013-11-12T23:50:23-03:00] DEBUG: Re-raising exception: TypeError - no implicit conversion of Array into String
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/environment.rb:248:in `directory?'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/environment.rb:248:in `load_from_file'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/environment.rb:241:in `load'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/node.rb:353:in `apply_expansion_attributes'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/node.rb:342:in `expand!'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:357:in `expand_run_list'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:315:in `build_node'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:490:in `do_run'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:199:in `block in run'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:193:in `fork'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:193:in `run'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/application.rb:208:in `run_chef_client'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/application/solo.rb:221:in `block in run_application'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/application/solo.rb:213:in `loop'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/application/solo.rb:213:in `run_application'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/application.rb:66:in `run'
  /Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/bin/chef-solo:25:in `<top (required)>'
  /Users/tmatilai/.gem/ruby/2.0.0/bin/chef-solo:23:in `load'
  /Users/tmatilai/.gem/ruby/2.0.0/bin/chef-solo:23:in `<main>'
[2013-11-12T23:50:23-03:00] FATAL: Stacktrace dumped to /private/tmp/chef_paths/cache/cache/chef-stacktrace.out
[2013-11-12T23:50:23-03:00] DEBUG: TypeError: no implicit conversion of Array into String
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/environment.rb:248:in `directory?'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/environment.rb:248:in `load_from_file'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/environment.rb:241:in `load'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/node.rb:353:in `apply_expansion_attributes'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/node.rb:342:in `expand!'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:357:in `expand_run_list'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:315:in `build_node'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:490:in `do_run'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:199:in `block in run'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:193:in `fork'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/client.rb:193:in `run'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/application.rb:208:in `run_chef_client'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/application/solo.rb:221:in `block in run_application'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/application/solo.rb:213:in `loop'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/application/solo.rb:213:in `run_application'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/lib/chef/application.rb:66:in `run'
/Users/tmatilai/.gem/ruby/2.0.0/gems/chef-11.8.0/bin/chef-solo:25:in `<top (required)>'
/Users/tmatilai/.gem/ruby/2.0.0/bin/chef-solo:23:in `load'
/Users/tmatilai/.gem/ruby/2.0.0/bin/chef-solo:23:in `<main>'
[2013-11-12T23:50:23-03:00] ERROR: no implicit conversion of Array into String

================================================================================
Error expanding the run_list:
================================================================================

Unexpected Error:
-----------------
TypeError: no implicit conversion of Array into String

[2013-11-12T23:50:21-03:00] INFO: Forking chef instance to converge...
[2013-11-12T23:50:21-03:00] DEBUG: Fork successful. Waiting for new chef pid: 33604
[2013-11-12T23:50:23-03:00] FATAL: Chef::Exceptions::ChildConvergeError: Chef run process exited unsuccessfully (exit code 1)
```
