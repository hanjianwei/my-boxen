class people::hanjianwei::mirrors inherits people::hanjianwei::config {
  include boxen::gemrc

  File <| title == "/Users/${::boxen_user}/.gemrc" |> {
    source  => "${dotfiles}/Gem/gemrc",
    require => Repository["${dotfiles}"]
  }
}
