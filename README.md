# init-branch

## Proposal for replacing engineering terms with racist connotations

The terms "master", "slave" (especially in combination, e.g. "master/slave database relication"), "whitelist", "blacklist" have racist connotations. Unfortunately, these terms are commonplace in computer science. It's time to become more welcoming to black engineers by avoiding terms loaded with prejudice.


## Why now?

As of 2020 July 21, Github is one of the many companies working on this issue, yet why wait when it's so easy to get done now. Fear of choosing a "non-standard" default branch name can lead to loss of momentum to the initiative. Renaming a branch again is easy if a different name is desired.


## Why "init"?

Branch name "init" can be a replacement for "master" in source code repositories because this is the branch where all the initial development is done. Another option is "main". "Main" stresses the importance of the branch. Yet git is pull based. People pull whenever and from wherever. The importance of a given branch is subjective. So in that regard "main" would not be accurate.


## Status of this doc/tool

Currently this documentation and tooling will help your rename the "master" branch and occurrences of "master" in text.


## Renaming repository branch names

1. Rename the local branch:

```
git branch -m master init
git push origin init
```

2. Update Github default branch:

Go to your repo url. Click Settings. Click Branches. Make "init" the default branch.


3. Update .git/config

Replace all occurrences of "master" with "init", e.g.:
```
[branch "init"]
    remote = origin
    merge = refs/heads/init
```

4. Delete the "master" branch from GitHub

```
git push origin :master
```


## Replacing the text

Your repository may contain Documentation is github hyperlinks to itself. Renaming the branch may break
those links unless we also replace the occurrence of "master" in text.

This script will help you do so. It will prompt you whether you want to replace all occurrences at once (which you can then go over with `git diff` or replace one file at a time).

You can find [replace_text.sh](https://github.com/alevchuk/init-branch/blob/init/replace_text.sh) in this repo. For a quick start, simply to this in your local repository checkout that your trying to clean up:
```
cd YOUR_LOCAL_REPO
curl https://raw.githubusercontent.com/alevchuk/init-branch/init/replace_text.sh > ./replace_text.sh
chmod +x ./replace_text.sh
./replace_text.sh

```

NOTE: this may break references to external repositories that still use the problematic term


## The New Look

![git-status](https://github.com/alevchuk/init-branch/blob/init/img/git-status.png)

![github-branch](https://github.com/alevchuk/init-branch/blob/init/img/github-branch.png)
