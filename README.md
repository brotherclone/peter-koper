# Peter Koper, Flaneur
## A Stroll Along Life's Boulevard

## Install

### Clone the repository

```shell
git clone git@github.com:brotherclone/peter-koper
cd peter-koper
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.2`

If not, install the right ruby version using [rvm](https://rvm.io/) (it could take a while):

```shell
rvm install 3.1.1 
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Set up Git Flow
Install [Git Flow](https://skoch.github.io/Git-Workflow/)
```
brew install git-flow
```

Use Main/Develop/Feature Braching.


### Set environment variables

Using [Dot Env Rails](https://github.com/bkeepers/dotenv):

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve

```shell
rails s
```

## Deploy

### With Heroku pipeline, where main is tied to deployment

Push to Heroku staging remote:

```shell
git push develop
```
