if status is-interactive
set -g fish_greeting
fastfetch
echo "---------------------------------------------------------------------------------------"
fortune -s | cowsay -f tux
starship init fish | source
end

