function pbpaste
    switch (uname)
        case Darwin
	    command pbpaste $argv
	case '*'
	    xclip -selection clipboard -o $argv
    end
end
