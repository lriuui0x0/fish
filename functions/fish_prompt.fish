function fish_prompt
    set -l status_copy $status

    set_color $fish_color_user
    echo -n $USER

    echo -n ' '

    set_color $fish_color_cwd
    echo -n (string replace -r "^$HOME" '~' (pwd))

    fish_git_prompt

    if test $status_copy -ne 0
        echo -n ' '
	set_color $fish_color_error
	echo -n [$status_copy]
    end

    echo 

    set_color normal
    echo -n '> '
end

