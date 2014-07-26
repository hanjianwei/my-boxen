class people::hanjianwei::applications {

  # Declare all Homebrew packages
  package { ['ack',
             'git-flow-avh',
             'qt5',
             'reattach-to-user-namespace',
             'tmux',
             'vim',
             'wget']:
    ensure => 'latest'
  }

  homebrew::tap { 'homebrew/science': }
  ->
  package { 'opencv':
    ensure => 'latest'
  }

  # Declare all Homebrew Cask packages
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
             'java',
             'java6',
             'karabiner',
             'keyboard-maestro',
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
  homebrew::tap { 'hanjianwei/apps': }
  ->
  package { 'squirrel':
    provider => 'brewcask'
  }

  homebrew::tap { 'caskroom/fonts': }
  ->
  package { ['font-anonymous-pro',
             'font-dejavu-sans',
             'font-dejavu-sans-mono-for-powerline',
             'font-inconsolata-dz-for-powerline',
             'font-inconsolata-for-powerline',
             'font-noto-sans',
             'font-noto-sans-s-chinese',
             'font-noto-sans-t-chinese',
             'font-noto-sans-japanese',
             'font-noto-sans-korean',
             'font-noto-serif',
             'font-roboto',
             'font-sauce-code-powerline',
             'font-source-code-pro',
             'font-source-sans-pro',
             'font-source-serif-pro',
             'font-terminus',
             'font-ubuntu-mono-powerline']:
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
                      'karabiner',
                      'prezto',
                      'seil',
                      'squirrel',
                      'tmux',
                      'vim',
                      'vimperator',
                      'zsh']:
  }
}
