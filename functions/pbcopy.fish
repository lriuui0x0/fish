function pbcopy
    switch (uname)
        case Darwin
	    command pbcopy $argv
	case '*'
	    xclip -selection clipboard $argv
    end
end
