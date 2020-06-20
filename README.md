# first-branch

get rid of "master" terminology

The terms "master", "slave", "whitelist", "blacklist" have racist origins. Unfortunately, they are commonplace in the language of the computer science community. It's time to become more welcoming to black engineers by using language that avoids terms loaded with prejudice.

## Why first?

Supposedly Github is working on this issue, yet why wait when it's so easy to do.

I picked the name "first" for my repos because it's the same meaning as primary yet shorter. First does not mean "main" or "authoritative". Git is pull based. People only pull the changes that they want. So in that regard "main" would not be accurate.

## Renaming repository branch names

1. Rename the local branch:

```
git branch -m master first
git push origin first
```

2. Update Github default branch:

Go to your repo url. Click Settings. Click Branches. Make "first" the default branch.


3. Update .git/config

Replace all occurrences of "master" with "first", e.g.:
```
[branch "first"]
    remote = origin
    merge = refs/heads/first
```

4. Delete the "master" branch from GitHub

```
git push origin :master
```

## The New Look

![git-status](https://github.com/alevchuk/first-branch/blob/first/img/git-status.png)

![github-branch](https://github.com/alevchuk/first-branch/blob/first/img/github-branch.png)
