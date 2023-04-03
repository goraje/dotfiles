set -g fish_color_autosuggestion '555' 'brblack'
set -g fish_color_cancel -r
set -g fish_color_command 'green' --bold
set -g fish_color_param white
set -g fish_color_option white
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'breyellow' '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow' '--background=brblack'
set -g fish_color_selection 'white' '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path white

status --is-interactive; and brew shellenv | source
status --is-interactive; and starship init fish | source
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
status --is-interactive; and zoxide init fish | source
status --is-interactive; and fnm env --use-on-cd | source
