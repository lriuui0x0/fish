set PATH (cat $HOME/.config/PATH 2>/dev/null || true) $PATH

set -l fish_greeting ''

set -x EDITOR nvim

begin
    if not pgrep ssh-agent
        eval (ssh-agent -c)
    # Some environment don't have persistent environment variables
    else if pgrep ssh-agent ; and not set -q SSH_AGENT_PID SSH_AUTH_SOCK
        pkill ssh-agent
        eval (ssh-agent -c)
    end

    for key in (ls ~/.ssh | grep -v -e '^known_hosts$' -e '^authorized_keys$' -e '.*\.pub')
        ssh-add ~/.ssh/$key
    end > /dev/null
end &> /dev/null


# Created by `userpath` on 2020-12-02 23:22:03
set PATH $PATH /home/lriuui0x0/.local/bin
