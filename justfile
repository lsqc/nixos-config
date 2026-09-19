hostname := `hostname`
user := `whoami`

default:
    @just --choose

rebuild:
    home-manager switch --flake .#{{user}}@{{hostname}}

system-rebuild:
    nh os switch . -H {{hostname}}
