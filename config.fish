set PATH /Library/TeX/texbin $PATH

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

