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
  class { 'dotfiles::tmux':
    require => Package['tmux'],
  }

  class { 'dotfiles::vim':
    require => Package['vim'],
  }

  class { 'dotfiles::emacs':
    require => Package['emacs-mac'],
  }

  class { 'dotfiles::vimperator':
    require => Package['firefox'],
  }

  class { 'dotfiles::keyremap4macbook':
    require => Package['keyremap4macbook'],
  }

  class { 'dotfiles::seil':
    require => Package['seil']
  }

  osx_chsh { $boxen_user:
    shell => '/bin/zsh'
  }

  include dotfiles::git
  include dotfiles::zsh
  include dotfiles::rubygems
}
