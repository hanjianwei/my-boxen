class people::hanjianwei::osx inherits people::hanjianwei::config {
  # Zsh
  osx_chsh { $boxen_user:
    shell => '/bin/zsh'
  }

  repository { "${home}/.zprezto":
    source => 'sorin-ionescu/prezto'
  }
  ->
  file { "${home}/.zshrc":
    ensure  => link,
    target  => "${dotfiles}/Zsh/zshrc",
    require => Repository["${dotfiles}"]
  }
  ->
  file { "${home}/.zshenv":
    ensure  => link,
    target  => "${dotfiles}/Zsh/zshenv",
    require => Repository["${dotfiles}"]
  }
  ->
  file { "${home}/.zpreztorc":
    ensure  => link,
    target  => "${dotfiles}/Zsh/zpreztorc",
    require => Repository["${dotfiles}"]
  }
  ->
  file { "${home}/.zlogin":
    ensure  => link,
    target  => "${dotfiles}/Zsh/zlogin",
    require => Repository["${dotfiles}"]
  }
  ->
  file { "${home}/.zlogout":
    ensure  => link,
    target  => "${dotfiles}/Zsh/zlogout",
    require => Repository["${dotfiles}"]
  }
  file { "${home}/.activate.sh":
    ensure  => link,
    target  => "${dotfiles}/Zsh/activate.sh",
    require => Repository["${dotfiles}"]
  }

  # Setup mirrors
  include people::hanjianwei::mirrors

  # OSX settings
  include 'osx::global::expand_save_dialog'
  include 'osx::global::tap_to_click'
  include 'osx::disable_app_quarantine'
  include 'osx::finder::show_all_on_desktop'
  include 'osx::finder::unhide_library'
}
