function duration-preexec {
    start_unixtime=$( date +%s )
}

function duration-precmd {
    if [ -z "$start_unixtime" ]; then
        return 0
    fi

    local end_unixtime
    end_unixtime=$( date +%s )
    local duration=$(( end_unixtime - start_unixtime ))

    local threadshold
    if [ "$ZSH_DURATION_THRESHOLD" ]; then
        threadshold="$ZSH_DURATION_THRESHOLD"
    else
        threadshold=10
    fi

    if [ "$duration" -le "$threadshold" ]; then
        return 0
    fi

    local sec=$(( duration % 60 ))
    local min=$(( duration % 3600 / 60 ))
    local hour=$(( duration / 3600 ))
    printf "Duration: %d:%02d:%02d\n\n" $hour $min $sec

    unset start_unixtime
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec duration-preexec
add-zsh-hook precmd duration-precmd
