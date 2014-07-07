class people::hanjianwei::repositories inherits people::hanjianwei::config {
  # Git
  file { "${home}/.gitconfig":
    target  => "${dotfiles}/Git/gitconfig",
    require => Repository["${dotfiles}"]
  }

  # Repos
  repository { "${dotfiles}":
    source => 'hanjianwei/dotfiles'
  }
}
