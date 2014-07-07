class people::hanjianwei (
  $home     = $people::hanjianwei::config::home,
  $dotfiles = $people::hanjianwei::config::dotfiles,
  $srcdir   = $people::hanjianwei::config::srcdir
) inherits people::hanjianwei::config {
  include people::hanjianwei::osx
  include people::hanjianwei::repositories
  include people::hanjianwei::applications
}
