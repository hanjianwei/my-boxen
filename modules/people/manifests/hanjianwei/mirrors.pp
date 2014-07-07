class people::hanjianwei::mirrors(
  $home     = $people::hanjianwei::config::home,
  $dotfiles = $people::hanjianwei::config::dotfiles
) {
  include boxen::gemrc

  File <| title == "${home}/.gemrc" |> {
    source  => "${dotfiles}/Gem/gemrc",
    require => Repository["${dotfiles}"]
  }
}
