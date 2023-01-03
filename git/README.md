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

### 1.4 Configuring Git
Answer : You need to type two lines to configure Git and link it to GitHub.

In the following commands:

• Replace USERNAME with the username that you created on GitHub

• Replace EMAIL with your email address
```bash
git config --global user.name "USERNAME"
git config --global user.email "EMAIL"
```
