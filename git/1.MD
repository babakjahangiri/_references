## git configuration

`git config -l ` : list all variables in your config

`git config --global user.name "John Doe" ` : set your name in the git config

`git config --global user.email "john.doe@gmail.com" ` : set your email in the git config

## Basic Command

`git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY ` : clone a remote repository to your machine`

`git init ` : initialize a new local git repository

`git status ` : Show all files which have changes to commit

# git add

`git add .` : : adds all changes in the working directory to the staging area
`git add *` : adds all changes in the working directory to the staging area
`git add -A` : : adds all changes in the working directory to the staging area

# git commit

`git commit -m` : commit selected files with a commit message
`git commit -a -m` : commit all changed files with a message

`git add folder/file.txt` : add specific path to your git stage

# Undo Last Commit

`git reset --soft HEAD~1`

# Undo git add before commit :

`git reset <file>`

## git checkout

`git checkout <commit-hash>` : go to specific commit
