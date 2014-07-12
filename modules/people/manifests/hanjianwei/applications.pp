class people::hanjianwei::applications {

  # Declare all Homebrew packages
  package { ['wget',
             'qt5',
             'tmux',
             'vim']:
  }

  homebrew::tap { 'homebrew/science': }
  ->
  package { 'opencv': }

  # Declare all Hombrew Cask packages
  include brewcask

  package { ['acorn',
             'alfred',
             'atom',
             'bettertouchtool',
             'caffeine',
             'cleanmymac',
             'dropbox',
             'evernote',
             'fantastical',
             'firefox',
             'google-chrome',
             'hazel',
             'iterm2',
             'keyboard-maestro',
             'keyremap4macbook',
             'mactex',
             'omnifocus',
             'onepassword',
             'parallels',
             'pycharm-ce',
             'scapple',
             'screenflow',
             'scrivener',
             'seil',
             'shiori',
             'trim-enabler',
             'qq',
             'qt-creator',
             'vagrant',
             'virtualbox',
             'welly',
             'xmind']:
    provider => 'brewcask'
  }

  # Taps
  homebrew::tap { 'caskroom/fonts': }
  ->
  package { 'font-inconsolata-for-powerline':
    provider => 'brewcask'
  }

  homebrew::tap { 'caskroom/versions': }
  ->
  package { 'intellij-idea-ultimate12':
    provider => 'brewcask'
  }

  homebrew::tap { 'railwaycat/emacsmacport': }
  ->
  package { 'emacs-mac':
    provider => 'brewcask'
  }

  # Apps configuration
  Package <| |> -> Dotfiles::Deploy <| |>

  osx_chsh { $boxen_user:
    shell => '/bin/zsh'
  }

  dotfiles::deploy { ['atom',
                      'bettertouchtool',
                      'emacs',
                      'git',
                      'iterm2',
                      'keyremap4macbook',
                      'prezto',
                      'seil',
                      'tmux',
                      'vim',
                      'vimperator',
                      'zsh']:
  }
}
