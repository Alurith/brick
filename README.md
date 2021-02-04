# Brick
Scripts to deploy and update [ServUO](https://www.servuo.com) on Linux.

**This project is currently in beta and should not be used on production enviroments**

## Installing
To use this script to deploy and update your ServUo, clone this project in your server's home directory.

Create a .env like the following example, use env-prototype as a reference.

```
# Server's code git GIT_URL
GIT_URL=https://github.com/ServUO/ServUO

# Where to deploy your project
PROJECT_PATH=/home/my_username/workspace
CODE_DIR=uocode
DATA_DIR=uodata

# Which branch to check for update
BRANCH=live
```

Make ```congigure.sh``` executable
```
chmod -x configure.sh
```
Execute ```congigure.sh```
```./congigure.sh```

To update and deploy your ServUo using git hooks you should configure a new remote on your local repository. Change ```remote_name``` ```username``` ```myserver``` ```project_path``` accordingly. **Do not change project.git**
 
```git remote add remote_name username@myservercom:project_path/project.git```

### Note
If its the first time you execute your server you should create an admin account and save. Otherwise it will have problems during the updates.

## Updating your ServUo
On your local repository run
```git push remote_name branch```

## Test
Currently tested on the following systems
| Tested on        | Working |
| ---------------- | ------- |
| Ubuntu 20.04 LTS | Yes     |

## How to contribute
If you want to contribute you can just submit a pull request.

## Found a bug?
Please describe your issue on the [issues section](https://github.com/Alurith/brick/issues).

## Credits
* [ServUO](https://www.servuo.com)
* [Using template with bash](https://stackoverflow.com/a/21265156)
* [Simple automated GIT Deployment using GIT Hooks](https://gist.github.com/noelboss/3fe13927025b89757f8fb12e9066f2fa)
* [Use .env files with bash](https://gist.github.com/mihow/9c7f559807069a03e302605691f85572)