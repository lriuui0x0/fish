function tig
    set -l git_dir (git rev-parse --git-dir 2> /dev/null)
    if test $status -ne 0
        echo 'Not a git directory' 1>&2
    end
    echo 'git dir set to '$git_dir

    if test (count $argv) -eq 0 ; or begin; test (count $argv) -eq 1 ; and test $argv[1] = 'push' ; end
        git reset (git commit-tree HEAD^{tree} -m 'Last published at '(date))
        git push --force origin master
    else if test (count $argv) -eq 1 ; and test $argv[1] = 'pull'
        git fetch --all
        git reset --hard origin/master
    else
        printf 'invalid command\nUse tig [push] or tig pull instead\n' 1>&2
    end
end

