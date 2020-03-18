function fish_right_prompt
    set_color normal
    printf '%.3fs  ' (math $CMD_DURATION / 1000)
end
