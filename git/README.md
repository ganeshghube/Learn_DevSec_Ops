## 1) Git for Beginners


### 1.1 What is version control?

Answer: Version control, also known as source control, is the practice of tracking and managing changes to software code. 

--> It helps developers to  manage changes to source code over time.

--> It helps software teams work faster and smarter on Developement.

--> VCS keeps track of every modification to the code in a special kind of databasesoftware teams work faster and smarter.

--> It helps to Organise distrubuted code in best manners.

### 1.2 What is git?

Answer: Git (/ɡɪt/) is a distributed version control system: tracking changes in any set of files, usually used for coordinating work among programmers collaboratively developing source code during software development. Its goals include speed, data integrity, and support for distributed, non-linear workflows (thousands of parallel branches running on different systems).
Git was originally authored by Linus Torvalds in 2005 for development of the Linux kernel, with other kernel developers contributing to its initial development.Since 2005, Junio Hamano has been the core maintainer. As with most other distributed version control systems, and unlike most client–server systems, every Git directory on every computer is a full-fledged repository with complete history and full version-tracking abilities, independent of network access or a central server. Git is free and open-source software distributed under the GPL-2.0-only license.

### 1.3 Why we should use git?

Answer: Git provides Performance / Security / Flexibility.

--> Performance : Git provides commiting, branching, merging and comparing past versions are all optimized for performance.

--> Security :  The content of the files as well as the true relationships between files and directories, versions, tags and commits, all of these objects in the Git repository are secured with a cryptographically secure hashing algorithm called SHA1. This protects the code and the change history against both accidental and malicious change and ensures that the history is fully traceable.

--> Flexibility : Git is flexible in several respects: in support for various kinds of nonlinear development workflows, in its efficiency in both small and large projects and in its compatibility with many existing systems and protocols.

### 1.4 Installation of Git.

Answer:  
You probably have Git installed already — try typing at the command line and see if it returns a version number. If it says the command is not found, use your package manager to install it move to next step.
```bash
git --version
```

If you are using a RedHat style, distribution (RedHat, CentOS or Fedora),
```bash
sudo yum -y install git
```
or on the newer distributions
```bash
sudo dnf -y install git
```

### 1.4 Getting Started with Github.
Answer : The first thing you need to do is create yourself a GitHub account. Since you are a student, you can create yourself a student account. GitHub is free to use providing you are happy to make all your repositories public. If you want private repositories you have to pay unless you are a student or an academic in which case you can have free private accounts.

As explained in the Introduction, one of the main things you will want to do with GitHub is synchronize your local repository with it. GitHub requires you to log in with your username and password. This would be rather a nuisance if everytime you wanted to synchronize your local Git repository with GitHub you had to specify your username and password. Fortunately a mechanism is provided to allow you to avoid this.
First you need to create yourself what is known as an SSH key
```bash
cd
mkdir .ssh
cd .ssh
ssh-keygen
```

ssh-keygen will probably ask you where you want to save the key. Simply press the Return key to accept the default. 
ssh-keygen will then ask you to enter a passphrase. Simply press the Return key so that no passphrase is generated. You will then have to press the Return key a second time to confirm your (empty) passphrase.
Now if you type ls, you should find that you have two files called id_rsa (your private key) and id_rsa.pub (your public key). Display your public key:
```bash
cat id_rsa.pub
```

Copy and paste the whole of the public key that you displayed a moment ago (the content of id_rsa.pub) into the Key box. In GitHub, click the menu item at the top right (it may be a picture of you if you have added a profile picture) and choose Settings from the menu. Click Add SSH key at the bottom of this section of the web page.

```
ssh -T git@github.com
git remote set-url origin git@github.com:ganeshghube/Learn_DevSec_Ops.git
```
Above command will help to authenticate ssh keys remote repo

### 1.4 Configuring Git
Answer : You need to type two lines to configure Git and link it to GitHub.

In the following commands:

• Replace USERNAME with the username that you created on GitHub

• Replace EMAIL with your email address
```bash
git config --global user.name "USERNAME"
git config --global user.email "EMAIL"
```

### 1.5 What is git repository ? Initilize a git repository into a foler
Answer:  A Git repository is a virtual storage of your project. It allows you to save versions of your code, which you can access when needed. To create a new repo, you'll use the git init command. git init is a one-time command you use during the initial setup of a new repo. Executing this command will create a new .git subdirectory in your current working directory. This will also create a new main branch. 
```bash
mkdir test && cd test
git init
````

### 1.6 What is git clone? what is difference between git clone and git init?
Answer: git clone is primarily used to point to an existing repo and make a clone or copy of that repo at in a new directory, at another location. The original repository can be located on the local filesystem or on remote machine accessible supported protocols. The git clone command copies an existing Git repository

Cloning a local or remote repository : Cloning to a specific folder. Clone the repository located at ＜repo＞ into the folder called ~＜directory＞! on the local machine.
```bash
git clone <repo> <directory>
git clone https://github.com/ganeshghube/Learn_DevSec_Ops.git  test
```

Cloning with specific tag
```bash
git clone --branch <tag> <repo>
git clone --branch main https://github.com/ganeshghube/Learn_DevSec_Ops.git
```

Using shallow options to partially clone repositories
```bash
git clone -depth=1 <repo>
git clone --depth=1 https://github.com/ganeshghube/Learn_DevSec_Ops.git
```


Git clone Branch, The -branch argument lets you specify a specific branch to clone instead of the branch the remote HEAD is pointing to, usually the main branch. In addition you can pass a tag instead of branch for the same effect.
```bash
git clone --branch
git clone --branch main https://github.com/ganeshghube/Learn_DevSec_Ops.git
```

Difference between git clone and git init?

A quick note: git init and git clone can be easily confused. At a high level, they can both be used to "initialize a new git repository." However, git clone is dependent on git init. git clone is used to create a copy of an existing repository. Internally, git clone first calls git init to create a new repository. It then copies the data from the existing repository, and checks out a new set of working files.

### 1.7 How to add new files in existing git repo ?

Add a new file in existing codebase in staging area.
```bash
touch newfile.txt; echo "Add a first line" >> newfile.txt
git add .  
#git add newfile.txt   #just to add newfile provides file name if you need to add all file add .
```

To verify a file which is added in staging area check git status command
```bash
git status
```

See the screen capture here.


![gitstatus logo](https://github.com/ganeshghube/Learn_DevSec_Ops/blob/main/git/images/gitstatus.JPG "git status")


### 1.8 How to commit files and push to remote repository?
Answer: To commit files use following commands.
```bash
git commit -m 'added new file'
git push -u origin master #is used for pushing local content to GitHub.
```

### 1.9 How to see logs?
Answer:  Git log is the command by using a log status of repo has been checked
```bash
git log

git log --since=2.weeks

git log --oneline has been used to see logs status in single line.

git log -n <limit>  #Limit the number of commits by

git log --stat  #Condense each commit to a single line. This is useful for getting a high-level overview of the project history.

git log -p   #Along with the ordinary git log information, include which files were altered and the relative number of lines that were added or deleted from each of them.

git log --author="<pattern>"   #Display the patch representing each commit. This shows the full diff of each commit, which is the most detailed view you can have of your project history.

git log --graph --decorate --oneline  #Only display commits that include the specified file. This is an easy way to see the history of a particular file.

git log --oneline --graph --decorate

git log --oneline --graph --decorate --all

git log --stat

git log --patch

```

### 1.10 How to ignore files to push and commit to the repo?
Answer: 
tracked - a file which has been previously staged or committed;

untracked - a file which has not been staged or committed; or

ignored - a file which Git has been explicitly told to ignore.

In addition to these characters, you can use # to include comments in your .gitignore file:

```bash
# ignore all logs
*.log

# ignore the file literally named foo[01].txt
foo\[01\].txt

#Ignoring a previously committed file
$ echo debug.log >> .gitignore
  
$ git rm --cached debug.log
rm 'debug.log'
  
$ git commit -m "Start ignoring debug.log"

#Debugging .gitignore files
$ git check-ignore -v debug.log
.gitignore:3:*.log  debug.log

```


### 1.11 How git clean | git revert | git reset | git rm  ?
git clean is a convenience method for deleting untracked files in a repo's working directory. Untracked files are those that are in the repo's directory but have not yet been added to the repo's index with git add. Overall the effect of git clean can be accomplished using git status and the operating systems native deletion tools. Git clean can be used alongside git reset to fully undo any additions and commits in a repository.


```bash
git clean -n   #Would remove untracked_file

git clean -f # The force option initiates the actual deletion of untracked files from the current directory. Force is required unless the clean.requireForce configuration option is set to false. This will not remove untracked folders or files specified by .gitignore. Let us now execute a live git clean in our example repo.

git clean -f <path> #-d include directories The -d option tells git clean that you also want to remove any untracked directories, by default it will ignore directories. We can add the -d option to our previous examples.

git clean -dn  # Would remove untracked_dir/

git clean -df  #Removing untracked_dir/
```

The git revert command can be considered an 'undo' type command, however, it is not a traditional undo operation. Instead of removing the commit from the project history, it figures out how to invert the changes introduced by the commit and appends a new commit with the resulting inverse content. This prevents Git from losing history, which is important for the integrity of your revision history and for reliable collaboration.

The git revert command is used for undoing changes to a repository's commit history. Other 'undo' commands like, git checkout and git reset, move the HEAD and branch ref pointers to a specified commit. Git revert also takes a specified commit, however, git revert does not move ref pointers to this commit. A revert operation will take the specified commit, inverse the changes from that commit, and create a new "revert commit". The ref pointers are then updated to point at the new revert commit making it the tip of the branch.
```bash
git revert HEAD  #[main b9cd081] Revert "prepend content to demo file" 1 file changed, 1 deletion(-)

git revert b9cd081  # git revert <commit id>  it will revert upto the commit id.

```

Remove the specified file from the staging area, but leave the working directory unchanged. This unstages a file without overwriting any changes.
```bash
git reset ＜file＞
```
 
Reset the staging area to match the most recent commit, but leave the working directory unchanged. This unstages all files without overwriting any changes, giving you the opportunity to re-build the staged snapshot from scratch.
```bash
git reset
```
 

Reset the staging area and the working directory to match the most recent commit. In addition to unstaging changes, the --hard flag tells Git to overwrite all changes in the working directory, too. Put another way: this obliterates all uncommitted changes, so make sure you really want to throw away your local developments before using it.
```
git reset --hard
```
 

Move the current branch tip backward to commit, reset the staging area to match, but leave the working directory alone. All changes made since  will reside in the working directory, which lets you re-commit the project history using cleaner, more atomic snapshots.
```
git reset  
```


Move the current branch tip backward to   and reset both the staging area and the working directory to match. This obliterates not only the uncommitted changes, but all commits after, as well.
```
git reset --hard
```


To remove a file from Git, you have to remove it from your tracked files (moreaccurately, remove it from your staging area) and then commit. The git rm command does that, and also removes the file from your working directory so you don’t see it as an untracked file the next time around.
If you simply remove the file from your working directory, it shows up under the “Changed but not updated” (that is, unstaged) area of your git status
```
rm PROJECTS.md
git rm PROJECTS.md
git rm log/\*.log #You can pass files, directories, and file-glob patterns to the git rm command. 

```


### 1.12 Moving Files
Unlike many other VCS systems, Git doesn’t explicitly track file movement. If you rename a file in Git, no metadata is stored in Git that tells it you renamed the file. However, Git is pretty smart about figuring that out the fact – we’ll deal with detecting file movement a bit later.
Thus it’s a bit confusing that Git has a mv command. If you want to rename a file in Git, you can run something like:
```
git mv file_from file_to
git mv README.md README
git status

mv README.md README
git rm README.md
git add README

```

### 1.13 GIt Branches
Let’s say you create a new branch called testing. You do this with the git branch command.
```
git branch test
```

To switch to an existing branch, you run the git checkout command. Let’s switch to the new testing branch:
```
git checkout test
```

To create a new branch and swith into it
```
git checkout -b test
```

To Delete a Branch
```
git checkout -d test
```

To List all Branches
```
git branch -a
```


### 1.14 GIt Merging
Suppose you’ve decided that your issue #test work is complete and ready to be merged into your master branch. In order to do that, you’ll merge your #test
branch into master, much like you merged your hotfix branch earlier. All you have to do is check out the branch you wish to merge into and then run the git
merge command:
```
git checkout master #Switched to branch 'master'

git merge test #Merge made by the 'recursive' strategy.
```

### 1.15 Basic Merge Conflicts
Occasionally, this process doesn’t go smoothly. If you changed the same part of the same file apperently in the two branches you’re merging together, Git won’t be able to merge them cleanly. If your fix for issue #test modified the same part of a file as the hotfix, you’ll get a merge conflict that looks something like this.

```
git merge test

git status

git mergetool

git branch -v

git branch --merged  #To see all the branches that contain work you have merged in

git branch --no-merged #To see all the branches that contain work you haven’t yet merged in
```


### 1.15 Basic Merge Conflicts
When you work with a team (and even sometimes when you are working alone) you will occasionally create merge conflicts. At first, merge conflicts can be intimidating, but resolving them is actually quite easy. In this section you will learn how!
These exercises will focus on the technical "how". In real merge conflicts, it's important to know who to ask in case you aren't sure how to resolve the conflict on your own. Usually it's a good idea to ask the person who made the conflicting changes, or someone who referenced in the CODEOWNERS file.

Resolving a Merge Conflict (practice alone)
If it's difficult to practice with a partner, you can do that by alone by following below.

Please follow the following steps to fix merge conflicts in Git:

```
1: Check the Git status: git status

2: Get the patchset: git fetch (checkout the right patch from your Git commit)

3: Checkout a local branch (temp1 in my example here): git checkout -b temp1

4: Pull the recent contents from master: git pull --rebase origin master

5: Start the mergetool and check the conflicts and fix them...and check the changes in the remote branch with your current branch: git mergetool

6: Check the status again: git status

7: Delete the unwanted files locally created by mergetool, usually mergetool creates extra file with *.orig extension. Please delete that file as that is just the duplicate and fix changes locally and add the correct version of your files. git add #your_changed_correct_files

8: Check the status again: git status

9: Commit the changes to the same commit id (this avoids a new separate patch set): git commit --amend

10: git rebase --continue

11: Push to the master branch: git push (to your Git repository)
```

### 1.16  Update your local copy of the repository: 
```
git pull --prune
```

### 1.17  Git Revert: 
revert	Generally safe since it creates a new commit.
commit --amend	Only use on local commits.
reset	Only use on local commits.
cherry-pick	Only use on local commits.
rebase	Only use on local commits.

```
git revert <SHA>  #Initialize the revert: 
Type a commit message.
Push your changes to GitHub.

git show SHA.
```

### 1.18  Git Tags
A tag is a pointer that points to a specific commit. Git tags are of two variants, an annotated tag and a lightweight tag. An annotated tag is an immutable object unlike a lightweight tag which is mutable. Let's practice a bit with tags.

Tags can be created locally with Git, or on GitHub. When creating a tag from the command line, it's recommended to create an "annotated" tag. The following example creates an annotated tag with the -a flag, names the tag v1.0, and connects it to whichever commit SHA is included.

Add a release to GitHub Games

On GitHub, navigate to the Code tab of the repository.

Under your repository name, click Releases.

Click Draft a new release.

Type a name for the tag. We recommend you use semantic versioning.

Select a branch that contains the project you want to release. Usually, you'll want to release against your main branch, unless you're releasing beta software. You can also select a recent commit by choosing the recent commits tab.

Type a title and description that describes your release.

If you're ready to publicize your release, click Publish release. Otherwise, click Save draft to work on it later.

```
git tag -a v1.0 <SHA>
git tag --list #To see all tags, type   
```


### 1.19  Understanding Git merge strategies
Git uses three primary merge strategies:

Fast-forward
A fast-forward merge assumes that no changes have been made on the base branch since the feature branch was created. This means that the branch pointer for base can simply be "fast forwarded" to point to the same commit as the feature branch.

Recursive
A recursive merge means that changes have been made on both the base branch and the feature branch and git needs to recursively combine them. With a recursive merge, a new "merge commit" is made to mark the point in time when the two branches came together. This merge commit is special because it has more than one parent.

Octopus
A merge of 3 or more branches is an octopus merge. This will also create a merge commit with multiple parents.

### 1.20  Understanding Git rebase

git rebase enables you to modify your commit history in a variety of ways. For example, you can use it to reorder commits, edit them, squash multiple commits into one, and much more.

To enable all of this, rebase comes in several forms. For today's class, we'll be using interactive rebase: git rebase --interactive, or git rebase -i for short.

Typically, you would use git rebase -i to:

Replay one branch on top of another branch
Edit previous commit messages
Combine multiple commits into one
Delete or revert commits that are no longer necessary

### 1.21  GitFlow
Considered to be a bit complicated and advanced for many of today’s projects, GitFlow enables parallel development where developers can work separately from the master branch on features where a feature branch is created from the master branch.

Afterwards, when changes are complete, the developer merges these changes back to the master branch for release.

This branching strategy consists of the following branches:

Master 
Develop
Feature- to develop new features that branches off the develop branch 
Release- help prepare a new production release; usually branched from the develop branch and must be merged back to both develop and master
Hotfix- also helps prepare for a release but unlike release branches, hotfix branches arise from a bug that has been discovered and must be resolved; it enables developers to keep working on their own changes on the develop branch while the bug is being fixed.
The main and develop branches are considered to be the main branches, with an infinite lifetime, while the rest are supporting branches that are meant to aid parallel development among developers, usually short-lived.


![gitsflow logo](https://github.com/ganeshghube/Learn_DevSec_Ops/blob/main/git/images/gitflow.png "git status")