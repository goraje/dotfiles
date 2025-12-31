set -gx fish_color_autosuggestion '555' 'brblack'
set -gx fish_color_cancel -r
set -gx fish_color_command 'green' --bold
set -gx fish_color_param white
set -gx fish_color_option white
set -gx fish_color_comment red
set -gx fish_color_cwd green
set -gx fish_color_cwd_root red
set -gx fish_color_end brmagenta
set -gx fish_color_error brred
set -gx fish_color_escape 'breyellow' '--bold'
set -gx fish_color_history_current --bold
set -gx fish_color_host normal
set -gx fish_color_match --background=brblue
set -gx fish_color_normal normal
set -gx fish_color_operator bryellow
set -gx fish_color_quote yellow
set -gx fish_color_redirection brblue
set -gx fish_color_search_match 'bryellow' '--background=brblack'
set -gx fish_color_selection 'white' '--background=brblack'
set -gx fish_color_user brgreen
set -gx fish_color_valid_path white
set -gx LSCOLORS GxExFxgxFxDxgxFxFxGxGx
set -gx EDITOR vim
set -gx fish_greeting ""

if status is-interactive; and command -q /opt/homebrew/bin/brew
	/opt/homebrew/bin/brew shellenv | source
end

if status is-interactive; and command -q fzf
    fzf --fish | source
end

if status is-interactive; and command -q starship
	starship init fish | source
end

if status is-interactive; and command -q zoxide
	zoxide init fish | source
end

if status is-interactive; and command -q fnm
	fnm env --use-on-cd | source
end
