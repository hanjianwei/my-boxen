class people::hanjianwei::applications(
  $home     = $people::hanjianwei::config::home,
  $dotfiles = $people::hanjianwei::config::dotfiles
) {

  # Declare all Homebrew packages
  package {
    [
      'wget',
      'qt5',
      'tmux',
      'vim'
    ]:
  }

  homebrew::tap { 'homebrew/science': }
  ->
  package { 'opencv': }

  # Declare all Hombrew Cask packages
  include brewcask

  package {
    [
      'acorn',
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
      'xmind'
    ]:
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

  # tmux
  Package['tmux']
  ->
  file { "${home}/.tmux.conf":
    ensure  => link,
    target  => "${dotfiles}/tmux/tmux.conf",
    require => Repository["${dotfiles}"]
  }

  # Vim
  Package['vim']
  ->
  file { "${home}/.vimrc":
    ensure  => link,
    target  => "${dotfiles}/Vim/vimrc",
    require => Repository["${dotfiles}"]
  }
  ->
  file { ["${home}/.vim", "${home}/.vim/bundle"]:
    ensure => directory
  }
  ->
  repository { "${home}/.vim/bundle/Vundle.vim":
    source => 'gmarik/Vundle.vim'
  }
  ->
  exec { 'vim +BundleInstall +BundleClean +qall': }


  # Emacs mac port
  Package['emacs-mac']
  ->
  file { "${home}/.emacs.d":
    ensure => directory
  }
  ->
  file { "${home}/.emacs.d/init.el":
    ensure  => link,
    target  => "${dotfiles}/Emacs/init.el",
    require => Repository["${dotfiles}"]
  }
  ->
  repository { "${home}/.emacs.d/snippets":
    source => 'hanjianwei/yasnippet-snippets'
  }

  # Firefox
  Package['firefox']
  ->
  file { "${home}/.vimperatorrc":
    target  => "${dotfiles}/Vimperator/vimperatorrc",
    require => Repository["${dotfiles}"]
  }

  # KeyRemap4Macbook
  # include keyremap4macbook
  # include keyremap4macbook::login_item
  # keyremap4macbook::remap { 'private.f19_to_hyper': }
  # keyremap4macbook::private_xml { 'private.xml':
  #   source  => "${dotfiles}/KeyRemap4MacBook/private.xml",
  #   require => Repository["${dotfiles}"]
  # }

  # Seil
  #include seil
  #include seil::login_item
  #seil::bind { 'keyboard bindings':
    #mappings => { 'capslock' => 80 }
  #}

  # Vagrant
  #include vagrant
  #vagrant::plugin { 'vagrant-vbguest': }
}
