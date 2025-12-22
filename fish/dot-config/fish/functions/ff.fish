function ff
    if command -q aeropace fzf
	    aerospace list-windows --all | fzf --bind 'enter:become(bash -c "aerospace focus --window-id {1}")'
    else
        if not command -q aerospace
            echo "aerospace is not installed"
        end
        if not command -q fzf
            echo "fzf is not installed"
        end
    end
end
