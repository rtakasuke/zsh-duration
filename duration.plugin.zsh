function get-threadshold {
    if [ $ZSH_DURATION_THRESHOLD ]; then
        echo $ZSH_DURATION_THRESHOLD
    else
        echo 10
    fi
}

function duration-preexec {
    start_unixtime=$( date +%s )
}

function duration-precmd {
    if [ -z $start_unixtime ]; then
        return 0
    fi

    local end_unixtime=$( date +%s )
    local diff_unixtime=$(( $end_unixtime - $start_unixtime ))

    threadshold=$(get-threadshold)
    if [ $diff_unixtime -le $threadshold ]; then
        return 0
    fi

    local sec=$(( $diff_unixtime % 60 ))
    local min=$(( $diff_unixtime % 3600 / 60 ))
    local hour=$(( $diff_unixtime / 3600 ))
    printf "Duration: %d:%02d:%02d\n\n" $hour $min $sec

    unset start_unixtime
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec duration-preexec
add-zsh-hook precmd duration-precmd
