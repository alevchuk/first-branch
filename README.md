# init-branch

The terms "master", "slave", "whitelist", "blacklist" have racist connotation. Unfortunately, these terms are commonplace in the language of the computer science community. It's time to become more welcoming to black engineers by avoiding terms loaded with prejudice.


## Why now?

Supposedly Github is also working on this issue, yet why wait when it's so easy to get done now. Fear of choosing the name that others will not choose can lead to loss of momentum to the initiative. Renaming a branch again is easy if one decides they want a different default branch name.


## Why "init"?

Branch name "init" can be a replacement for "master" in source code repositories because this is the branch were all the initial development is done. Another option is "main". "Main" stresses the imporance of the branch. Yet git is pull based. People only pull whenever and from wherever they want. The importance of a given branch is subjective. So in that regard "main" would not be accurate.


## Satus of this doc/tool

Currently this documentation and tooling will help your rename the "master" branch and occurances of "master" in text.

I try to add the handling of other terms this month...


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

...


## The New Look

![git-status](https://github.com/alevchuk/init-branch/blob/init/img/git-status.png)

![github-branch](https://github.com/alevchuk/init-branch/blob/init/img/github-branch.png)
