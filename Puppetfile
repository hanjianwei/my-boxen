# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "hjw-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Shortcut for personal module
def hjw(name, version)
  mod name, version, :github_tarball => "hanjianwei/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "git",         "2.6.0"
github "hub",         "1.3.0"
github "inifile",     "1.1.3",      :repo => "puppetlabs/puppetlabs-inifile"
github "nodejs",      "4.0.0"
github "openssl",     "1.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.4"
github "stdlib",      "4.3.2",      :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
github "osx",         "2.7.1"

# Personal/Forked modules
hjw "boxen",          "3.7.1.rc"
hjw "homebrew",       "1.9.7.rc"
hjw "brewcask",       "0.0.4.rc2"
hjw "dotfiles",       "0.1.0"
hjw "python",         "0.0.3"
