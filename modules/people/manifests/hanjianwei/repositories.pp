class people::hanjianwei::repositories(
  $home     = $people::hanjianwei::config::home,
  $dotfiles = $people::hanjianwei::config::dotfiles,
  $srcdir   = $people::hanjianwei::config::srcdir
) {

  # Git
  file { "${home}/.gitconfig":
    target  => "${dotfiles}/Git/gitconfig",
    require => Repository["${dotfiles}"]
  }

  # Repos
  repository { "${dotfiles}":
    source => 'hanjianwei/dotfiles'
  }

  repository { "${srcdir}/diyao/web":
    source => 'hanjianwei/diyao-web'
  }
}
