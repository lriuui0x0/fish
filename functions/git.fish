function git
    if test (count $argv) -eq 1 ; and test $argv[1] = 'publish'
        set remote (git config --get remote.origin.url)
        rm -rf .git
        git init
        git config user.name "Rui Liu"
        git config user.email "lriuui0x0@gmail.com"
        git add -A
        git commit -m "Published at "(date)
        git remote add origin $remote
        git push --force --set-upstream origin master
    else
        command git $argv
    end
end

