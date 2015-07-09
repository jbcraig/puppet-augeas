# Public: Install augeas via homebrew.
#
# Examples
#
#   include augeas
class augeas {
  case $::operatingsystem {
    'Darwin': {
      include homebrew
      include pkgconfig

      homebrew::formula { 'augeas': }

      package { 'augeas':
        name   => 'boxen/brews/augeas',
        ensure => '1.3.0-boxen2'
      }
    }

    default: {
      package { 'augeas': }
    }
  }

  Package <| title == 'augeas' |> {
    require +> Class['pkgconfig']
  }
}
